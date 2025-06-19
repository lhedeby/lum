use std::{io::{stdout, Write}, time::Instant};

use compiler::Compiler;
use parser::Parser;
use vm::Vm;

mod compiler;
mod vm;
mod lexer;
mod node;
mod opcode;
mod parser;


pub fn run_file(path: &str) {
    println!("run file");

    let start = Instant::now();
    let root = Parser::parse_file(path);
    root.pretty_print("", true);


    let mut compiler = Compiler::new();
    compiler.compile(&root);

    let bytecode = compiler.code;
    let strings = compiler.strings;
    println!("\nBytecode: {:?}", bytecode);
    println!("Strings: {:?}\n", strings);
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
