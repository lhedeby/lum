use std::{
    fs,
    io::{stdout, Write},
    time::Instant,
};

use compiler::Compiler;
use parser::Parser;
use vm::Vm;

mod compiler;
mod lexer;
mod node;
mod opcode;
mod parser;
mod vm;

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
            .map(|x| format!("{:?}", x))
            .collect::<Vec<String>>()
            .join("\n"),
    )
    .unwrap();
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
