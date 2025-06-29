use luma::{run_bytecode, run_file};

fn main() {
    // run_file("lum/test.lum")
    // run_file("lum/main.lum");
    println!("=== COMPILING STARTED ===");
    run_bytecode("compilers/1/lum_out.l", "compilers/1/lum_out_strings.l");
    println!("=== COMPILING DONE ===");
    println!("=== RUNNING STARTED ===");
    run_bytecode("lum_out.l", "lum_out_strings.l");
    println!("=== RUNNING DONE ===");
    //run_file("lum/sample.lum");
    
}
