use std::{
    fs,
    io::{stdout, Write},
    str::FromStr,
    time::Instant,
};

use opcode::OpCode;
use vm::Vm;

mod opcode;
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

    let mut vm = Vm::new(code_from_file, strings);
    vm.run(&mut stdout());
    println!("done running bytecode")
}

pub fn run_with_compiler(compiler_path: &str) {
    let (code, strings) = read_bytecode(compiler_path);
    let mut vm = Vm::new(code, strings);
    vm.run(&mut stdout());
    
    let (code, strings) = read_bytecode("test.l");
    let mut vm = Vm::new(code, strings);
    vm.run(&mut stdout());

    println!("done...")
}

fn read_bytecode(path: &str) -> (Vec<OpCode>, Vec<String>) {
    let file = fs::read_to_string(path).unwrap();
    let mut lines = file.lines();
    let string_count: usize = lines.next().unwrap().parse().unwrap();
    let strings: Vec<String> = lines.by_ref().take(string_count).map(|l| l.to_string()).collect();
    let code = lines.map(|l| OpCode::from_str(l).unwrap()).collect();
    (code, strings)

}
