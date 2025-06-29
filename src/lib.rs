use std::{
    fs,
    io::{stdout, Write},
    str::FromStr,
    time::Instant,
};

use compiler::Compiler;
use opcode::OpCode;
use parser::Parser;
use vm::Vm;

mod compiler;
mod lexer;
mod node;
mod opcode;
mod parser;
mod vm;

pub fn run_bytecode(bytecode_path: &str, strings_path: &str) {

    let code_from_file: Vec<OpCode> = fs::read_to_string(bytecode_path)
        .unwrap()
        .lines()
        .into_iter()
        .map(|x| OpCode::from_str(x).unwrap())
        .collect();

    let strings: Vec<String> = fs::read_to_string(strings_path)
        .unwrap()
        .lines()
        .into_iter()
        .map(|x| x.to_string())
        .collect();
    //println!("running bytecode: {:?}", code_from_file);
    let mut vm = Vm::new(code_from_file, strings);
    vm.run(&mut stdout());
    println!("done running bytecode")
}

pub fn run_file(path: &str) {
    println!("=== run file ===");

    let start = Instant::now();
    let root = Parser::parse_file(path);
    // root.pretty_print("", true);

    let mut compiler = Compiler::new();
    compiler.compile(&root);

    let bytecode = compiler.code;
    let strings = compiler.strings;
    fs::write(
        "rust_out.l",
        bytecode
            .iter()
            .map(|x| match x {
                OpCode::PushInt(i) => format!("PushInt|{}", i),
                OpCode::PushBool(b) => format!("PushBool|{}", b),
                OpCode::PushFloat(f) => format!("PushFloat|{}", f),
                OpCode::PushNil => format!("PushNil"),
                OpCode::JumpIfFalse(p) => format!("JumpIfFalse|{}", p),
                OpCode::SetLocal(i) => format!("SetLocal|{}", i),
                OpCode::GetLocal(i) => format!("GetLocal|{}", i),
                OpCode::Jump(p) => format!("Jump|{}", p),
                OpCode::Plus => format!("Plus"),
                OpCode::Minus => format!("Minus"),
                OpCode::Native(n) => format!("Native|{}", n),
                OpCode::PushString(s) => format!("PushString|{}", s),
                OpCode::List(l) => format!("List|{}", l),
                OpCode::GetField(f) => format!("GetField|{}", f),
                OpCode::SetField(f) => format!("SetField|{}", f),
                OpCode::Instance(l1, l2, l3) => format!(
                    "Instance|{}|{}|{}",
                    l1.join(","),
                    l2.join(","),
                    l3.iter()
                        .map(|x| x.to_string())
                        .collect::<Vec<String>>()
                        .join(",")
                ),
                OpCode::Get(i) => format!("Get|{}", i),
                OpCode::Set(i) => format!("Set|{}", i),
                OpCode::Call(name, code) => format!("Call|{}|{}", name, code),
                OpCode::Return => format!("Return"),
                OpCode::Pop => format!("Pop"),
                OpCode::Neg => format!("Neg"),
                OpCode::Not => format!("Not"),
                OpCode::Equals => format!("Equals"),
                OpCode::NotEquals => format!("NotEquals"),
                OpCode::Or => format!("Or"),
                OpCode::And => format!("And"),
                OpCode::Less => format!("Less"),
                OpCode::LessEqual => format!("LessEqual"),
                OpCode::Greater => format!("Greater"),
                OpCode::GreaterEqual => format!("GreaterEqual"),
                OpCode::IndexGet => format!("IndexGet"),
                OpCode::IndexSet => format!("IndexSet"),
                OpCode::PushSelf => format!("PushSelf"),
                OpCode::Print(s) => format!("Print|{}", s),
            })
            .collect::<Vec<String>>()
            .join("\n"),
    )
    .unwrap();

    let code_from_file: Vec<OpCode> = fs::read_to_string("rust_out.l")
        .unwrap()
        .lines()
        .into_iter()
        .map(|x| OpCode::from_str(x).unwrap())
        .collect();

    if code_from_file.len() != bytecode.len() {
        panic!("len diff bytecode")
    }
    for (first, second) in bytecode.iter().zip(code_from_file) {
        println!("{:?} === {:?}", first, second)
    }

    fs::write("rust_out_strings.l", strings.join("\n")).unwrap();

    let s2: Vec<String> = fs::read_to_string("rust_out_strings.l")
        .unwrap()
        .lines()
        .into_iter()
        .map(|x| x.to_string())
        .collect();

    if s2.len() != strings.len() {
        panic!("len diff")
    }
    for (first, second) in strings.iter().zip(s2) {
        if *first != second {
            panic!("forst is not seconds")
        }
    }

    let mut vm = Vm::new(bytecode, strings);
    vm.run(&mut stdout());
    println!("\n");

    println!(
        "Execution time: {}ms",
        Instant::now().duration_since(start).as_millis()
    );
}

pub fn run_code(code: &str, out: &mut impl Write) {
    let root = Parser::parse_code(code);

    let mut compiler = Compiler::new();
    compiler.compile(&root);

    let bytecode = compiler.code;
    let strings = compiler.strings;
    let mut vm = Vm::new(bytecode, strings);
    vm.run(out);
}
