use std::collections::HashMap;

use crate::node::{Node, Param, Type};
use crate::opcode::OpCode;

pub struct Compiler {
    pub code: Vec<OpCode>,
    pub strings: Vec<String>,
    variables: Vec<HashMap<String, Local>>,
    depth: usize,
    classes: Vec<Class>,
    current_fields: Option<Vec<Param>>,
}

#[derive(Clone, Debug)]
struct Local {
    stack_pos: usize,
    depth: usize,
    kind: Type,
}

#[derive(Debug)]
struct Class {
    name: String,
    fields: Vec<Param>,
    functions: Vec<CompilerFunction>,
}

#[derive(Debug)]
struct CompilerFunction {
    name: String,
    pub params: Vec<Param>,
    pub code_start: usize,
    pub return_kind: Option<Type>,
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
        }
    }

    fn add_local(&mut self, name: &str, kind: Type) {
        let ll = self.variables.len() - 1;
        if let Some(map) = self.variables.last_mut() {
            map.insert(
                name.to_string(),
                Local {
                    stack_pos: map.len() + ll,
                    depth: self.depth,
                    kind,
                },
            );
        } else {
            panic!("no map")
        }
    }
    fn get_local(&mut self, key: &str) -> Local {
        for v in self.variables.iter().rev() {
            if let Some(val) = v.get(key) {
                return val.clone();
            }
        }
        panic!("could not find variable")
    }
    fn begin_scope(&mut self) {
        self.depth += 1;
    }
    fn end_scope(&mut self) {
        if let Some(vars) = self.variables.last_mut() {
            vars.retain(|_, v| v.depth != self.depth);
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

    pub fn compile(&mut self, node: &Node) -> Option<Type> {
        match node {
            Node::Root(stmts) | Node::Block { stmts } => {
                self.begin_scope();
                for stmt in stmts {
                    self.compile(stmt);
                }
                self.end_scope();
                None
            }
            Node::Neg(node) => {
                let kind = self.compile(node);
                self.code.push(OpCode::Neg);
                kind
            }
            Node::Not(node) => {
                self.compile(node);
                self.code.push(OpCode::Not);
                Some(Type::Bool)
            }
            Node::Float(value) => {
                self.code.push(OpCode::PushFloat(*value));
                Some(Type::Float)
            }
            Node::Int(value) => {
                self.code.push(OpCode::PushInt(*value));
                Some(Type::Int)
            }
            Node::String(s) => {
                self.code.push(OpCode::PushString(self.strings.len()));
                self.strings.push(s.to_string());
                Some(Type::String)
            }
            Node::Index { lhs, indexer } => {
                let kind = self.compile(lhs);
                match self.compile(indexer) {
                    Some(Type::Int) => {}
                    _ => panic!("indexer must be an int"),
                }
                self.code.push(OpCode::IndexGet);
                kind
            }
            Node::IndexSet { lhs, indexer, rhs } => {
                let lhs_kind = self.compile(lhs);

                match self.compile(indexer) {
                    Some(Type::Int) => {}
                    _ => panic!("indexer must be an int"),
                }
                let rhs_kind = self.compile(rhs);
                match (lhs_kind, rhs_kind) {
                    (Some(k1), Some(k2)) => {
                        if k1 != k2 {
                            panic!("cannot reassign type '{:?}' to '{:?}'", k2, k1)
                        }
                    }
                    (Some(_), None) => {}
                    _ => panic!("invalid types"),
                }
                self.code.push(OpCode::IndexSet);
                None
            }
            Node::List { items, kind } => {
                for item in items {
                    match self.compile(item) {
                        Some(k) => {
                            if k != *kind {
                                panic!("wrong type in list!")
                            }
                        }
                        None => panic!("expected type in list"),
                    }
                }
                self.code.push(OpCode::List(items.len()));
                Some(kind.clone())
            }
            Node::Bool(value) => {
                self.code.push(OpCode::PushBool(*value));
                Some(Type::Bool)
            }
            Node::Nil => {
                self.code.push(OpCode::PushNil);
                None
            }
            Node::GetVar(name) => {
                let local = self.get_local(&name);
                let pos = local.stack_pos;
                let kind = local.kind.clone();
                self.code.push(OpCode::GetLocal(pos));
                Some(kind)
            }
            Node::Def { name, expr } => {
                match self.compile(expr) {
                    None => {
                        panic!("trying to define {} as something without a type", name)
                    }
                    Some(kind) => {
                        self.add_local(name, kind);
                    }
                }
                None
            }
            Node::Plus { lhs, rhs } => {
                let k1 = self.compile(lhs);
                let k2 = self.compile(rhs);
                if k1 != k2 {
                    panic!("different kunds in plus")
                }
                self.code.push(OpCode::Plus);
                k1
            }
            Node::SetField { name, expr } => {
                _ = self.compile(expr);
                for (idx, f) in self.current_fields.clone().unwrap().iter().enumerate() {
                    if f.name == *name {
                        self.code.push(OpCode::SetField(idx));
                        return None;
                    }
                }
                panic!("Could not find field '{name}'");
            }
            Node::GetField(name) => {
                for (idx, f) in self.current_fields.clone().unwrap().iter().enumerate() {
                    if f.name == *name {
                        self.code.push(OpCode::GetField(idx));
                        return Some(f.kind.clone());
                    }
                }
                panic!("Could not find field '{name}'")
            }
            // TODO: class functions (methods) should always return nil at the end of the method
            // a stmt call node should probably be specified to pop the unused value, but
            // otherwise we always want a value
            Node::Class {
                name,
                fields,
                functions,
            } => {
                let mut funcs = vec![];

                self.current_fields = Some(fields.to_vec());

                let jump = self.code.len();
                self.code.push(OpCode::Jump(usize::MAX));

                for f in functions {
                    self.begin_fun();
                    for pp in &f.params {
                        self.add_local(&pp.name, pp.kind.clone());
                    }
                    let code_start = self.code.len();
                    self.compile(&f.block);
                    let cf = CompilerFunction {
                        name: f.name.to_string(),
                        params: f.params.to_vec(),
                        code_start,
                        return_kind: f.return_kind.clone(),
                    };
                    funcs.push(cf);
                    self.code.push(OpCode::Return(false));
                    self.end_fun();
                }
                let end = self.code.len();
                if let OpCode::Jump(ref mut target) = self.code[jump] {
                    *target = end;
                } else {
                    unreachable!()
                }
                self.current_fields = None;

                let class = Class {
                    name: name.to_string(),
                    fields: fields.to_vec(),
                    functions: funcs,
                };
                self.classes.push(class);
                None
            }
            Node::Reassign { name, expr } => {
                let local = self.get_local(&name);
                let kind = self.compile(expr);
                if kind.is_some_and(|k| k != local.kind) {
                    // if local.kind != kind.expect("Cant be none") {
                    panic!("trying to reassign with a different type");
                }
                self.code.push(OpCode::SetLocal(local.stack_pos));
                None
            }
            Node::Pop { expr } => {
                self.compile(expr);
                self.code.push(OpCode::Pop);
                None
            }
            Node::Method { name, args, lhs } => {
                let kind = self.compile(lhs);
                let class_name = match kind {
                    Some(Type::Class(name)) => name,
                    _ => panic!("must be class"),
                };

                // todo: should this be here?
                for arg in args {
                    self.compile(arg);
                }
                for c in &self.classes {
                    if c.name == class_name {
                        for func in &c.functions {
                            if func.name == *name {
                                self.code
                                    .push(OpCode::Call(func.code_start, func.params.len() + 1)); // +1 for 'self'
                                return func.return_kind.clone();
                            }
                        }
                        panic!("could not find function")
                    }
                }
                panic!("could not find class")
            }
            // TODO: Theres 3 different calls:
            // NewInstance, Method, Native
            // Should probably split these in the parser
            // method is easy because its the only one with lhs
            Node::Call { name, args } => {
                // CREATE INSTANCE
                if let Some(class) = self.classes.iter().find(|c| c.name == *name) {
                    if args.len() != class.fields.len() {
                        panic!("arity does not match")
                    }

                    for arg in args {
                        self.compile(arg);
                    }

                    self.code.push(OpCode::Instance(args.len()));
                    Some(Type::Class(name.to_string()))
                } else {
                    // NATIVE CALL
                    let (num, arity, kind) = match name.as_str() {
                        "PRINT" => (0, 1, None),
                        "TO_STRING" => (1, 1, Some(Type::String)),
                        _ => panic!("no native function, {}", name),
                    };
                    if args.len() != arity {
                        panic!("wrong amount of arguments")
                    }
                    for arg in args {
                        self.compile(arg);
                    }
                    self.code.push(OpCode::Native(num));
                    kind
                }
            }
            Node::EqualEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Equals);
                Some(Type::Bool)
            }
            Node::If { condition, block } => {
                _ = self.compile(condition);
                let skip_jump = self.code.len();
                self.code.push(OpCode::JumpIfFalse(usize::MAX));
                self.compile(block);
                let end = self.code.len();
                if let OpCode::JumpIfFalse(ref mut target) = self.code[skip_jump] {
                    *target = end;
                } else {
                    unreachable!()
                }
                None
            }
            Node::Return(node) => {
                let expr = self.compile(node);
                self.code.push(OpCode::Return(true));
                expr
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
                    None
                } else {
                    unreachable!()
                }
            }
            Node::Or { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Or);
                Some(Type::Bool)
            }
            Node::And { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::And);
                Some(Type::Bool)
            }
            Node::BangEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::NotEquals);
                Some(Type::Bool)
            }
            Node::Greater { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Greater);
                Some(Type::Bool)
            }
            Node::GreaterEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::GreaterEqual);
                Some(Type::Bool)
            }
            Node::Less { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::Less);
                Some(Type::Bool)
            }
            Node::LessEqual { lhs, rhs } => {
                self.compile(lhs);
                self.compile(rhs);
                self.code.push(OpCode::LessEqual);
                Some(Type::Bool)
            }
            Node::Get { lhs, field } => {
                match self.compile(lhs) {
                    Some(Type::Class(name)) => {
                        for class in &self.classes {
                            if class.name == name {
                                for (idx, f) in class.fields.iter().enumerate() {
                                    if f.name == *field {
                                        self.code.push(OpCode::Get(idx));
                                        return Some(f.kind.clone());
                                    }
                                }
                                panic!("could not find field '{field}' in class '{name}'")
                            }
                        }
                    }
                    _ => panic!("cant dot a non-class"),
                }
                panic!("GET")
            }
            Node::Set { lhs, field, rhs } => {
                match self.compile(lhs) {
                    Some(Type::Class(name)) => {
                        _ = self.compile(rhs);
                        for class in &self.classes {
                            if class.name == name {
                                for (idx, f) in class.fields.iter().enumerate() {
                                    if f.name == *field {
                                        self.code.push(OpCode::Set(idx));
                                        return Some(f.kind.clone());
                                    }
                                }
                            }
                        }
                    }
                    _ => panic!("cant dot a non-class"),
                }
                panic!("GET")
            }
        }
    }
}
