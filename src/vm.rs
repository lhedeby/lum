use std::{collections::HashMap, io::Write};

use crate::opcode::OpCode;

pub struct Vm {
    code: Vec<OpCode>,
    strings: Vec<String>,
    lists: Vec<Vec<Value>>,
    instances: Vec<InstanceObj>,
    call_stack: Vec<CallFrame>,
}

#[derive(Debug)]
struct InstanceObj {
    variables: HashMap<String, Value>,
    methods: HashMap<String, usize>,
}

struct CallFrame {
    return_pos: usize,
    // is this needed?
    // arity: usize,
    stack_offset: usize,
}

#[derive(Debug, Clone)]
enum Value {
    Bool(bool),
    Float(f32),
    Int(i32),
    String(usize),
    List(usize),
    Instance(usize),
    Nil,
}

impl Vm {
    pub fn new(code: Vec<OpCode>, strings: Vec<String>) -> Self {
        Self {
            code,
            strings,
            lists: vec![],
            instances: vec![],
            call_stack: vec![],
        }
    }
    pub fn run(&mut self, out: &mut impl Write) {
        println!("started VM!");
        let mut ip = 0;
        let mut stack_offset = 0;
        let mut stack: Vec<Value> = Vec::with_capacity(64);

        while ip < self.code.len() {
            // println!("stack: {:?}", stack);
            // println!("instruction: {:?}", self.code[ip]);
            match self.code[ip] {
                OpCode::PushInt(v) => {
                    stack.push(Value::Int(v));
                    ip += 1;
                }
                OpCode::PushBool(v) => {
                    stack.push(Value::Bool(v));
                    ip += 1;
                }
                OpCode::PushFloat(v) => {
                    stack.push(Value::Float(v));
                    ip += 1;
                }
                OpCode::List(v) => {
                    let mut list = vec![];
                    for _ in 0..v {
                        list.push(stack.pop().unwrap())
                    }
                    list.reverse();
                    stack.push(Value::List(self.lists.len()));
                    self.lists.push(list);
                    ip += 1;
                }
                OpCode::Instance(ref field_names, ref method_names, ref starts) => {
                    let mut instance = InstanceObj {
                        variables: HashMap::new(),
                        methods: HashMap::new(),
                    };
                    for name in field_names {
                        instance
                            .variables
                            .insert(name.clone(), stack.pop().unwrap());
                    }

                    for i in 0..(starts.len()) {
                        instance.methods.insert(method_names[i].clone(), starts[i]);
                    }
                    stack.push(Value::Instance(self.instances.len()));
                    self.instances.push(instance);
                    ip += 1;
                }
                OpCode::Less => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let b = match (v1, v2) {
                        (Value::Float(f1), Value::Float(f2)) => f1 < f2,
                        (Value::Int(i1), Value::Int(i2)) => i1 < i2,
                        (a, b) => panic!("cant compare {:?}, {:?}", a, b),
                    };
                    stack.push(Value::Bool(b));
                    ip += 1;
                }
                OpCode::Plus => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    match (v1, v2) {
                        (Value::Float(f1), Value::Float(f2)) => stack.push(Value::Float(f1 + f2)),
                        (Value::Int(i1), Value::Int(i2)) => stack.push(Value::Int(i1 + i2)),
                        (Value::String(s1), Value::String(s2)) => {
                            let new_string = self.strings[s1].clone() + &self.strings[s2];
                            stack.push(Value::String(self.strings.len()));
                            self.strings.push(new_string);
                        }
                        _ => panic!("cant add"),
                    }
                    ip += 1;
                }
                OpCode::Minus => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    match (v1, v2) {
                        (Value::Float(f1), Value::Float(f2)) => stack.push(Value::Float(f1 - f2)),
                        (Value::Int(i1), Value::Int(i2)) => stack.push(Value::Int(i1 - i2)),
                        _ => panic!("cant subtract"),
                    }
                    ip += 1;
                }
                OpCode::JumpIfFalse(p) => {
                    let b = stack.pop().unwrap();
                    let v = match b {
                        Value::Bool(val) => val,
                        _ => unreachable!("JumpIfFalse"),
                    };
                    match v {
                        true => ip += 1,
                        false => ip = p,
                    }
                }
                OpCode::GetLocal(v) => {
                    stack.push(stack[v + stack_offset].clone());
                    ip += 1;
                }
                OpCode::SetLocal(v) => {
                    stack[v + stack_offset] = stack.pop().unwrap();
                    ip += 1;
                }
                OpCode::Jump(p) => {
                    ip = p;
                }
                OpCode::PushString(s) => {
                    stack.push(Value::String(s));
                    ip += 1;
                }
                OpCode::PushNil => {
                    stack.push(Value::Nil);
                    ip += 1;
                }
                OpCode::Print(n) => {
                    let mut values = vec![];
                    for _ in 0..n {
                        values.push(stack.pop().unwrap())
                    }

                    while let Some(v) = values.pop() {
                        write!(out, "{}", self.get_value_as_str(&v)).unwrap();
                        if !values.is_empty() {
                            write!(out, " ").unwrap();
                        }
                    }
                    write!(out, "\n").unwrap();
                    stack.push(Value::Nil);
                    ip += 1;
                }
                OpCode::Native(n) => {
                    match n {
                        // #print
                        0 => match stack.pop().unwrap() {
                            Value::String(s) => {
                                writeln!(out, "{}", self.strings[s]).unwrap();
                                stack.push(Value::Nil)
                            }
                            _ => panic!("cant print value"),
                        },
                        // #to_string
                        1 => {
                            let new_string = self.get_value_as_str(&stack.pop().unwrap());
                            stack.push(Value::String(self.strings.len()));
                            self.strings.push(new_string);
                        }
                        // #read_file
                        2 => match stack.pop().unwrap() {
                            Value::String(s) => {
                                let content = match std::fs::read_to_string(&self.strings[s]) {
                                    Ok(s) => s,
                                    Err(e) => format!("Error reading file: {} - {}", self.strings[s], e),
                                };
                                stack.push(Value::String(self.strings.len()));
                                self.strings.push(content);
                            }
                            _ => panic!("expected a string"),
                        },
                        // #len
                        3 => match stack.pop().unwrap() {
                            Value::String(s) => {
                                stack.push(Value::Int(self.strings[s].len() as i32))
                            }
                            Value::List(s) => stack.push(Value::Int(self.lists[s].len() as i32)),
                            _ => stack.push(Value::Nil),
                        },
                        // #err
                        4 => match stack.pop() {
                            Some(v) => {
                                panic!("err: {}", self.get_value_as_str(&v))
                            }
                            None => {
                                panic!("err")
                            }
                        },
                        5 => {
                            let val = stack.pop().unwrap();
                            let list = stack.pop().unwrap();
                            match list {
                                Value::List(l) => {
                                    self.lists[l].push(val);
                                    stack.push(Value::Nil)
                                }
                                _ => panic!("trying to push to something thats not a list")
                            }
                        }

                        6 => {
                            let list = stack.pop().unwrap();
                            match list {
                                Value::List(l) => {
                                    let val = self.lists[l].pop().unwrap();
                                    stack.push(val)
                                }
                                _ => panic!("trying to push to something thats not a list")
                            }
                        }
                        _ => panic!("native function {} not found", n),
                    }
                    ip += 1;
                }
                OpCode::SetField(ref f) => {
                    let val = stack.pop().unwrap();
                    match stack.get(stack_offset) {
                        Some(Value::Instance(instance)) => {
                            if let Some(test) = self.instances[*instance].variables.get_mut(f) {
                                *test = val
                            } else {
                                panic!("no field named {}", f)
                            }
                        }
                        Some(_) => panic!("must be instance"),
                        None => panic!("unexpected none"),
                    };
                    ip += 1;
                }
                OpCode::GetField(ref f) => {
                    let instance = match stack.get(stack_offset) {
                        Some(Value::Instance(instance)) => self.instances.get(*instance).unwrap(),
                        Some(_) => panic!("must be instance"),
                        None => panic!("unexpected none"),
                    };
                    let val = instance.variables.get(f).unwrap();
                    stack.push(val.clone());
                    ip += 1;
                }
                OpCode::Get(ref f) => {
                    let obj = match stack.pop().unwrap() {
                        Value::Instance(o) => self
                            .instances
                            .get(o)
                            .expect("instace out of range")
                            //.variables[f]
                            .variables.get(f)
                            .expect(&format!("could not find variable {}", f))
                            .clone(),
                        p => panic!("get must be on instance {:?}", p),
                    };
                    stack.push(obj);
                    ip += 1;
                }
                OpCode::Set(ref f) => {
                    let value = stack.pop().unwrap();
                    match stack.pop().unwrap() {
                        Value::Instance(o) => {
                            if let Some(test) = self.instances[o].variables.get_mut(f) {
                                *test = value
                            } else {
                                panic!("no field named {}", f)
                            }
                        }
                        p => panic!("get must be on instance {:?}", p),
                    };
                    ip += 1;
                }
                // Maybe there is something inheritly wrong with
                // this. @ should be the same as .self
                OpCode::PushSelf => {
                    stack.push(stack[stack_offset].clone());
                    ip += 1;
                }
                OpCode::Call(ref name, arity) => {
                    stack_offset = stack.len() - arity;
                    self.call_stack.push(CallFrame {
                        return_pos: ip + 1,
                        // arity,
                        stack_offset,
                    });

                    match stack[stack_offset] {
                        Value::Instance(i) => {
                            let iobc = &self.instances[i];
                            // println!("name: {name}");
                            // println!("iovbsc {:?}", iobc);
                            ip = iobc.methods[name];
                        }
                        _ => panic!("not instance"),
                    }
                }
                OpCode::Return => {
                    let value = stack.pop().unwrap();

                    let call_frame = self
                        .call_stack
                        .pop()
                        .expect("call stack should not be empty");
                    stack_offset = if let Some(so) = self.call_stack.last() {
                        so.stack_offset
                    } else {
                        0
                    };
                    while stack.len() > call_frame.stack_offset {
                        stack.pop();
                    }
                    ip = call_frame.return_pos;
                    stack.push(value);
                }
                OpCode::Pop => {
                    _ = stack.pop().unwrap();
                    ip += 1
                }
                OpCode::Not => {
                    match stack.pop() {
                        Some(Value::Bool(b)) => stack.push(Value::Bool(!b)),
                        _ => panic!("not a bool"),
                    }
                    ip += 1
                }
                OpCode::Equals => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let v = match (v1, v2) {
                        (Value::Bool(v1), Value::Bool(v2)) => v1 == v2,
                        (Value::Float(v1), Value::Float(v2)) => v1 == v2,
                        (Value::Int(v1), Value::Int(v2)) => v1 == v2,
                        (Value::String(v1), Value::String(v2)) => {
                            self.strings[v1] == self.strings[v2]
                        }
                        (Value::List(v1), Value::List(v2)) => v1 == v2,
                        (Value::Instance(v1), Value::Instance(v2)) => v1 == v2,
                        (Value::Nil, Value::Nil) => true,
                        (Value::Nil, _) => false,
                        (_, Value::Nil) => false,
                        (p1, p2) => panic!("cant compare types '{:?}', '{:?}'", p1, p2),
                    };

                    stack.push(Value::Bool(v));
                    ip += 1
                }
                OpCode::NotEquals => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let v = match (v1, v2) {
                        (Value::Bool(v1), Value::Bool(v2)) => v1 != v2,
                        (Value::Float(v1), Value::Float(v2)) => v1 != v2,
                        (Value::Int(v1), Value::Int(v2)) => v1 != v2,
                        (Value::String(v1), Value::String(v2)) => {
                            self.strings[v1] != self.strings[v2]
                        }
                        (Value::List(v1), Value::List(v2)) => v1 != v2,
                        (Value::Instance(v1), Value::Instance(v2)) => v1 != v2,
                        (Value::Nil, Value::Nil) => false,
                        (Value::Nil, _) => true,
                        (_, Value::Nil) => true,
                        _ => panic!("cant compare types"),
                    };

                    stack.push(Value::Bool(v));
                    ip += 1
                }
                OpCode::Or => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let v = match (v1, v2) {
                        (Value::Bool(v1), Value::Bool(v2)) => v1 || v2,
                        _ => panic!("cant compare types"),
                    };
                    stack.push(Value::Bool(v));
                    ip += 1
                }
                OpCode::And => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let v = match (v1, v2) {
                        (Value::Bool(v1), Value::Bool(v2)) => v1 && v2,
                        _ => panic!("cant compare types"),
                    };
                    stack.push(Value::Bool(v));
                    ip += 1
                }
                OpCode::LessEqual => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let b = match (v1, v2) {
                        (Value::Float(f1), Value::Float(f2)) => f1 <= f2,
                        (Value::Int(i1), Value::Int(i2)) => i1 <= i2,
                        (a, b) => panic!("cant compare {:?}, {:?}", a, b),
                    };
                    stack.push(Value::Bool(b));
                    ip += 1;
                }
                OpCode::Greater => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let b = match (v1, v2) {
                        (Value::Float(f1), Value::Float(f2)) => f1 > f2,
                        (Value::Int(i1), Value::Int(i2)) => i1 > i2,
                        (a, b) => panic!("cant compare {:?}, {:?}", a, b),
                    };
                    stack.push(Value::Bool(b));
                    ip += 1;
                }
                OpCode::GreaterEqual => {
                    let v2 = stack.pop().unwrap();
                    let v1 = stack.pop().unwrap();
                    let b = match (v1, v2) {
                        (Value::Float(f1), Value::Float(f2)) => f1 >= f2,
                        (Value::Int(i1), Value::Int(i2)) => i1 >= i2,
                        (a, b) => panic!("cant compare {:?}, {:?}", a, b),
                    };
                    stack.push(Value::Bool(b));
                    ip += 1;
                }
                OpCode::IndexGet => {
                    let indexer = stack.pop().unwrap();
                    let list = stack.pop().unwrap();
                    match (indexer, list) {
                        (Value::Int(i), Value::List(l)) => {
                            stack.push(self.lists[l][i as usize].clone())
                        }
                        // todo: Not sure if this should exist
                        (Value::Int(i), Value::String(s)) => {
                            let s_idx = self.strings.len();
                            let new_s = &self.strings[s][(i as usize)..((i + 1) as usize)];
                            self.strings.push(new_s.to_string());
                            stack.push(Value::String(s_idx));
                        }
                        _ => panic!("must be int and list"),
                    }
                    ip += 1;
                }
                OpCode::IndexSet => {
                    let new_value = stack.pop().unwrap();
                    let indexer = stack.pop().unwrap();
                    let list = stack.pop().unwrap();
                    match (indexer, list) {
                        (Value::Int(i), Value::List(l)) => self.lists[l][i as usize] = new_value,
                        _ => panic!("must be int and list"),
                    }
                    ip += 1;
                }
                _ => todo!("instruction not implemented: {:?}", self.code[ip]),
            }
        }
    }

    fn get_value_as_str(&self, val: &Value) -> String {
        match val {
            Value::Bool(b) => format!("{}", b),
            Value::Float(f) => format!("{}", f),
            Value::Int(i) => format!("{}", i),
            Value::List(l) => format!(
                "[{}]",
                self.lists[*l]
                    .iter()
                    .map(|x| self.get_value_as_str(x))
                    .collect::<Vec<String>>()
                    .join(", ")
            ),
            Value::String(s) => format!("{}", self.strings[*s]),
            Value::Instance(i) => format!(
                "{{{}}}",
                self.instances[*i]
                    .variables
                    .iter()
                    .map(|(_idx, x)| self.get_value_as_str(x))
                    .collect::<Vec<String>>()
                    .join(", ")
            ),
            Value::Nil => format!("nil"),
        }
    }
}
