use std::io::Write;

use crate::opcode::OpCode;

pub struct Vm {
    code: Vec<OpCode>,
    strings: Vec<String>,
    lists: Vec<Vec<Value>>,
    instances: Vec<Vec<Value>>,
    call_stack: Vec<CallFrame>,
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
                OpCode::Instance(i) => {
                    let mut instance = vec![];
                    for _ in 0..i {
                        instance.push(stack.pop().unwrap())
                    }
                    instance.reverse();
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
                        _ => panic!("cant add"),
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
                OpCode::Native(n) => {
                    match n {
                        // PRINT
                        0 => match stack.pop().unwrap() {
                            Value::String(s) => {
                                writeln!(out, "{}", self.strings[s]).unwrap();
                                stack.push(Value::Nil)
                            }
                            _ => panic!("cant print value"),
                        },
                        // TO_STRING
                        1 => {
                            let new_string = self.get_value_as_str(&stack.pop().unwrap());
                            stack.push(Value::String(self.strings.len()));
                            self.strings.push(new_string);
                        }
                        _ => panic!("native function {} not found", n),
                    }
                    ip += 1;
                }
                OpCode::SetField(f) => {
                    let val = stack.pop().unwrap();
                    let instance = match stack.get(stack_offset) {
                        Some(Value::Instance(instance)) => {
                            self.instances.get_mut(*instance).unwrap()
                        }
                        Some(_) => panic!("must be instance"),
                        None => panic!("unexpected none"),
                    };
                    instance[f] = val;
                    ip += 1;
                }
                OpCode::GetField(f) => {
                    let instance = match stack.get(stack_offset) {
                        Some(Value::Instance(instance)) => self.instances.get(*instance).unwrap(),
                        Some(_) => panic!("must be instance"),
                        None => panic!("unexpected none"),
                    };
                    let val = instance.get(f).unwrap();
                    stack.push(val.clone());
                    ip += 1;
                }
                OpCode::Get(idx) => {
                    let obj = match stack.pop().unwrap() {
                        Value::Instance(o) => self.instances[o][idx].clone(),
                        p => panic!("get must be on instance {:?}", p),
                    };
                    stack.push(obj);
                    ip += 1;
                }
                OpCode::Set(idx) => {
                    let value = stack.pop().unwrap();
                    match stack.pop().unwrap() {
                        Value::Instance(o) => self.instances[o][idx] = value,
                        p => panic!("get must be on instance {:?}", p),
                    };
                    ip += 1;
                }
                OpCode::Call(pos, arity) => {
                    stack_offset = stack.len() - arity;
                    self.call_stack.push(CallFrame {
                        return_pos: ip + 1,
                        // arity,
                        stack_offset,
                    });
                    ip = pos;
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
                            let new_s = &self.strings[s][(i as usize)..((i+1) as usize)];
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
                    .iter()
                    .map(|x| self.get_value_as_str(x))
                    .collect::<Vec<String>>()
                    .join(", ")
            ),
            Value::Nil => format!("nil"),
        }
    }
}
