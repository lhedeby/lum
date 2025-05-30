use std::collections::HashMap;

use crate::node::{Node};
use crate::opcode::OpCode;

pub struct Compiler {
    pub code: Vec<OpCode>,
    pub strings: Vec<String>,
    variables: Vec<HashMap<String, Local>>,
    depth: usize,
    classes: Vec<Class>,
    current_fields: Option<Vec<String>>,
    current_class_name: Option<String>,
}

#[derive(Clone, Debug)]
struct Local {
    stack_pos: usize,
    depth: usize,
}

#[derive(Debug)]
struct Class {
    name: String,
    fields: Vec<String>,
    functions: Vec<CompilerFunction>,
}

#[derive(Debug)]
struct CompilerFunction {
    name: String,
    //pub params: Vec<String>,
    pub code_start: usize,
}

impl Compiler {
    pub fn new() -> Self {
        Self {
            code: vec![],
            variables: vec![HashMap::new()],
            depth: 0,
            classes: vec![],
            strings: vec![],
            current_fields: None,
            current_class_name: None,
        }
    }

    fn add_local(&mut self, name: &str) {
        let ll = self.variables.len() - 1;
        if let Some(map) = self.variables.last_mut() {
            if map.contains_key(name) {
                panic!("cant define '{name}' again")
            }
            map.insert(
                name.to_string(),
                Local {
                    stack_pos: map.len() + ll,
                    depth: self.depth,
                },
            );
        } else {
            panic!("no map")
        }
    }
    fn get_local(&mut self, key: &str) -> Option<Local> {
        for v in self.variables.iter().rev() {
            if let Some(val) = v.get(key) {
                return Some(val.clone());
            }
        }
        None
    }
    fn begin_scope(&mut self) {
        self.depth += 1;
    }
    fn end_scope(&mut self) {
        if let Some(vars) = self.variables.last_mut() {
            let mut len = vars.len();
            vars.retain(|_, v| v.depth != self.depth);
            while len > vars.len() {
                len -= 1;
                self.code.push(OpCode::Pop);
            }
        }
        self.depth -= 1;
    }

    fn begin_fun(&mut self) {
        self.variables.push(HashMap::new());
        self.depth += 1;
    }
    fn end_fun(&mut self) {
        _ = self.variables.pop().expect("variables should not be empty");
        self.depth -= 1;
    }

    pub fn compile(&mut self, node: &Node) {
        match node {
            Node::Root(stmts) | Node::Block { stmts } => {
                self.begin_scope();
                for stmt in stmts {
                    self.compile(stmt);
                }
                self.end_scope();
            }
            Node::Neg(node) => {
                self.compile(node);
                self.code.push(OpCode::Neg);
            }
            Node::Not(node) => {
                self.compile(node);
                self.code.push(OpCode::Not);
            }
            Node::Float(value) => {
                self.code.push(OpCode::PushFloat(*value));
            }
            Node::Int(value) => {
                self.code.push(OpCode::PushInt(*value));
            }
            Node::String(s) => {
                self.code.push(OpCode::PushString(self.strings.len()));
                self.strings.push(s.to_string());
            }
            Node::Index { lhs, indexer } => {
                self.compile(lhs);
                self.compile(indexer);
                self.code.push(OpCode::IndexGet);
            }
            Node::IndexSet { lhs, indexer, rhs } => {
                self.compile(lhs);
                self.compile(indexer);
                self.compile(rhs);
                self.code.push(OpCode::IndexSet);
            }
            Node::List { items } => {
                for item in items {
                    self.compile(item)
                }
                self.code.push(OpCode::List(items.len()));
            }
            Node::Bool(value) => {
                self.code.push(OpCode::PushBool(*value));
            }
            Node::Nil => {
                self.code.push(OpCode::PushNil);
            }
            Node::GetVar(name) => {
                if let Some(local) = self.get_local(&name) {
                    let pos = local.stack_pos;
                    self.code.push(OpCode::GetLocal(pos));
                } else {
                    if let Some(class) = self.classes.iter().find(|c| c.name == *name) {
                        if class.fields.len() != 0 {
                            panic!("trying to call class without arguments")
                        }

                        let function_names: Vec<String> =
                            class.functions.iter().map(|f| f.name.clone()).collect();
                        let function_starts: Vec<usize> = class
                            .functions
                            .iter()
                            .map(|f| f.code_start.clone())
                            .collect();

                        self.code
                            .push(OpCode::Instance(vec![], function_names, function_starts));
                        return;
                    }
                    panic!("Could not find any variable with name '{}'", name)
                }
            }
            Node::Def { name, expr } => {
                self.compile(expr);
                self.add_local(name);
            }
            Node::Plus { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Plus);
            }
            Node::SetField { name, expr } => {
                self.compile(expr);
                self.code.push(OpCode::SetField(name.clone()));
            }
            Node::GetField(name) => {
                self.code.push(OpCode::GetField(name.clone()));
            }
            // TODO: class functions (methods) should always return nil at the end of the method
            // a stmt call node should probably be specified to pop the unused value, but
            // otherwise we always want a value
            Node::Class {
                name,
                fields,
                functions,
            } => {
                self.current_fields = Some(fields.to_vec());
                self.current_class_name = Some(name.clone());

                let jump = self.code.len();
                self.code.push(OpCode::Jump(usize::MAX));

                let class = Class {
                    name: name.to_string(),
                    fields: fields.to_vec(),
                    functions: vec![],
                };

                if let Some(_) = self.classes.iter().find(|c| c.name == class.name) {
                    panic!("cant define class '{}' multiple times", class.name);
                }
                self.classes.push(class);

                for f in functions {
                    self.begin_fun();
                    for pp in &f.params {
                        self.add_local(&pp);
                    }
                    let code_start = self.code.len();
                    self.compile(&f.block);
                    let cf = CompilerFunction {
                        name: f.name.to_string(),
                        //params: f.params.to_vec(),
                        code_start,
                    };
                    self.classes.last_mut().unwrap().functions.push(cf);
                    self.code.push(OpCode::PushNil);
                    self.code.push(OpCode::Return);
                    self.end_fun();
                }
                let end = self.code.len();
                if let OpCode::Jump(ref mut target) = self.code[jump] {
                    *target = end;
                } else {
                    unreachable!()
                }
                self.current_fields = None;
                self.current_class_name = None;
            }
            Node::Reassign { name, expr } => {
                if let Some(local) = self.get_local(&name) {
                    self.compile(expr);
                    self.code.push(OpCode::SetLocal(local.stack_pos));
                } else {
                    panic!("Could not find variable '{name}'")
                }
            }
            Node::Pop { expr } => {
                self.compile(expr);
                self.code.push(OpCode::Pop);
            }
            Node::Method { name, args, lhs } => {
                println!("method - name {name}");
                println!("lhs {:?}", lhs);

                if let Some(lhs) = lhs {
                    self.compile(lhs);
                } else {
                    self.code.push(OpCode::PushSelf);
                }

                for arg in args {
                    self.compile(arg);
                }

                self.code
                    .push(OpCode::Call(name.to_string(), args.len() + 1))
            }
            // TODO: Theres 3 different calls:
            // NewInstance, Method, Native
            // Should probably split these in the parser
            // method is easy because its the only one with lhs
            Node::Call { name, args } => {
                println!("call - name: {name}");
                if let Some(class) = self.classes.iter().find(|c| c.name == *name) {
                    if args.len() != class.fields.len() {
                        panic!("arity does not match")
                    }

                    let field_names: Vec<String> =
                        class.fields.iter().rev().map(|f| f.clone()).collect();
                    let function_names: Vec<String> =
                        class.functions.iter().map(|f| f.name.clone()).collect();
                    let function_starts: Vec<usize> = class
                        .functions
                        .iter()
                        .map(|f| f.code_start.clone())
                        .collect();
                    for arg in args {
                        self.compile(arg);
                    }

                    self.code.push(OpCode::Instance(
                        field_names,
                        function_names,
                        function_starts,
                    ));
                    return;
                }
                panic!("No class with name '{name}'");
            }
            Node::Native { name, args } => {
                let (num, arity) = match name.as_str() {
                    "print" => (0, 1),
                    "to_string" => (1, 1),
                    "read_file" => (2, 1),
                    "len" => (3, 1),
                    _ => panic!("no native function, {}", name),
                };
                if num != 0 && args.len() != arity {
                    panic!("wrong amount of arguments")
                }
                for arg in args {
                    self.compile(arg);
                }
                match num {
                    0 => self.code.push(OpCode::Print(args.len())),
                    _ => self.code.push(OpCode::Native(num)),
                }
            }
            Node::EqualEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Equals);
            }
            Node::If { condition, block } => {
                _ = self.compile(condition);
                let skip_jump = self.code.len();
                self.code.push(OpCode::JumpIfFalse(usize::MAX));
                self.compile(block);
                let end = self.code.len();
                if let OpCode::JumpIfFalse(ref mut target) = self.code[skip_jump] {
                    *target = end;
                    return;
                }
                unreachable!()
            }
            Node::Return(node) => {
                self.compile(node);
                self.code.push(OpCode::Return);
            }
            Node::While { condition, block } => {
                let loop_start = self.code.len();
                self.compile(condition);
                let exit_jump = self.code.len();
                self.code.push(OpCode::JumpIfFalse(usize::MAX));
                self.compile(block);
                self.code.push(OpCode::Jump(loop_start));
                let end = self.code.len();
                if let OpCode::JumpIfFalse(ref mut target) = self.code[exit_jump] {
                    *target = end;
                    return;
                }
                unreachable!()
            }
            Node::Or { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Or);
            }
            Node::And { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::And);
            }
            Node::BangEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::NotEquals);
            }
            Node::Greater { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Greater);
            }
            Node::GreaterEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::GreaterEqual);
            }
            Node::Less { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Less);
            }
            Node::LessEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::LessEqual);
            }
            Node::Get { lhs, field } => {
                self.compile(lhs);
                self.code.push(OpCode::Get(field.to_string()));
            }
            Node::Set { lhs, field, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Set(field.to_string()));
            }
        }
    }
}
