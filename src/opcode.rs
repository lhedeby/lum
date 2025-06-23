// use std::str::FromStr;

use std::str::FromStr;

#[derive(Debug)]
pub enum OpCode {
    PushInt(i32),
    PushBool(bool),
    PushFloat(f32),
    PushNil,
    JumpIfFalse(usize),
    SetLocal(usize),
    GetLocal(usize),
    Jump(usize),
    Plus,
    Minus,
    Native(usize),
    PushString(usize),
    List(usize),
    GetField(String),
    SetField(String),
    Instance(Vec<String>, Vec<String>, Vec<usize>),
    Get(String),
    Set(String),
    Call(String, usize),
    Return,
    Pop,
    Neg,
    Not,
    Equals,
    NotEquals,
    Or,
    And,
    Less,
    LessEqual,
    Greater,
    GreaterEqual,
    IndexGet,
    IndexSet,
    PushSelf,
    Print(usize),
}

#[derive(Debug)]
pub struct OpCodeErr {}
impl FromStr for OpCode {
    type Err = OpCodeErr;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s {
            "PushNil" => return Ok(OpCode::PushNil),
            "Plus" => return Ok(OpCode::Plus),
            "Minus" => return Ok(OpCode::Minus),
            "Return" => return Ok(OpCode::Return),
            "Pop" => return Ok(OpCode::Pop),
            "Neg" => return Ok(OpCode::Neg),
            "Not" => return Ok(OpCode::Not),
            "Equals" => return Ok(OpCode::Equals),
            "NotEquals" => return Ok(OpCode::NotEquals),
            "Or" => return Ok(OpCode::Or),
            "And" => return Ok(OpCode::And),
            "Less" => return Ok(OpCode::Less),
            "LessEqual" => return Ok(OpCode::LessEqual),
            "Greater" => return Ok(OpCode::Greater),
            "GreaterEqual" => return Ok(OpCode::GreaterEqual),
            "IndexGet" => return Ok(OpCode::IndexGet),
            "IndexSet" => return Ok(OpCode::IndexSet),
            "PushSelf" => return Ok(OpCode::PushSelf),
            s if s.starts_with("PushInt") => {
                todo!()
            }
            s if s.starts_with("PushInt") => {
                todo!()
            }
            s if s.starts_with("PushBool") => {
                todo!()
            }
            s if s.starts_with("PushFloat") => {
                todo!()
            }
            s if s.starts_with("JumpIfFalse") => {
                todo!()
            }
            s if s.starts_with("SetLocal") => {
                todo!()
            }
            s if s.starts_with("GetLocal") => {
                todo!()
            }
            s if s.starts_with("Jump") => {
                todo!()
            }
            s if s.starts_with("Native") => {
                todo!()
            }
            s if s.starts_with("PushString") => {
                todo!()
            }
            s if s.starts_with("List") => {
                todo!()
            }
            s if s.starts_with("GetField") => {
                todo!()
            }
            s if s.starts_with("SetField") => {
                todo!()
            }
            s if s.starts_with("Instance") => {
                todo!()
            }
            s if s.starts_with("Get") => {
                todo!()
            }
            s if s.starts_with("Set") => {
                todo!()
            }
            s if s.starts_with("Call") => {
                todo!()
            }
            s if s.starts_with("Print") => {
                todo!()
            }
            _ => {}
        }
        panic!("unkown")
    }
}
