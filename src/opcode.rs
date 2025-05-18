use std::str::FromStr;

#[derive(Debug)]
pub enum OpCode {
    PushInt(i32),
    PushBool(bool),
    PushFloat(f32),
    JumpIfFalse(usize),
    SetLocal(usize),
    GetLocal(usize),
    Jump(usize),
    Plus,
    Native(usize),
    PushString(usize),
    List(usize),
    GetField(String),
    SetField(String),
    Instance(usize),
    Get(String),
    Set(String),
    Call(usize, usize),
    Return(bool),
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
}


// #[derive(Debug)]
// pub struct OpCodeErr {}
// impl FromStr for OpCode {
//     type Err = OpCodeErr;
//
//     fn from_str(s: &str) -> Result<Self, Self::Err> {
//         if let Some((code, rest)) = s.split_once("|") {
//             match code {
//                 // push
//                 "PushNum" => Ok(OpCode::PushNum(rest.parse().unwrap())),
//                 "PushTrue" => Ok(OpCode::True),
//                 "PushFalse" => Ok(OpCode::False),
//                 "String" => Ok(OpCode::String(rest.parse().unwrap())),
//                 //operators
//                 "Add" => Ok(OpCode::Add),
//                 "Sub" => Ok(OpCode::Sub),
//                 "Div" => Ok(OpCode::Div),
//                 "Mod" => Ok(OpCode::Mod),
//                 "Mul" => Ok(OpCode::Mul),
//
//                 // comp
//                 "Equal" => Ok(OpCode::Equal),
//                 "NotEqual" => Ok(OpCode::NotEqual),
//                 "And" => Ok(OpCode::And),
//                 "Or" => Ok(OpCode::Or),
//                 "Not" => Ok(OpCode::Not),
//                 "Neg" => Ok(OpCode::Neg),
//
//                 // new
//                 //
//                 "GreaterEqual" => Ok(OpCode::GreaterEqual),
//                 "Greater" => Ok(OpCode::Greater),
//                 "LessEqual" => Ok(OpCode::LessEqual),
//                 "Less" => Ok(OpCode::Less),
//                 "Nil" => Ok(OpCode::Nil),
//                 "Lines" => Ok(OpCode::Lines),
//                 "ReadFile" => Ok(OpCode::ReadFile),
//                 "Split" => Ok(OpCode::Split),
//                 "Parse" => Ok(OpCode::Parse),
//
//                 // stuff
//                 "GetVar" => Ok(OpCode::GetVar(rest.parse().unwrap())),
//                 "SetVar" => Ok(OpCode::SetVar(rest.parse().unwrap())),
//                 "GetGlobal" => Ok(OpCode::GetGlobal(rest.parse().unwrap())),
//                 "SetGlobal" => Ok(OpCode::SetGlobal(rest.parse().unwrap())),
//                 // todo: -1 in compiler?
//                 "JumpIfFalse" => Ok(OpCode::JumpIfFalse(rest.parse::<usize>().unwrap() - 1)),
//                 "StackPop" => Ok(OpCode::StackPop),
//                 // funs
//                 "FunStart" => Ok(OpCode::FunStart(rest.parse().unwrap())),
//                 "FunEnd" => Ok(OpCode::FunEnd),
//                 "Call" => Ok(OpCode::Call(rest.parse().unwrap())),
//                 "Return" => Ok(OpCode::Return),
//                 "Capture" => Ok(OpCode::Capture(rest.parse().unwrap())),
//                 "GetUpvalue" => Ok(OpCode::GetUpvalue(rest.parse().unwrap())),
//
//                 "Get" => Ok(OpCode::Get),
//                 "Set" => Ok(OpCode::Set),
//                 "Obj" => Ok(OpCode::Obj(rest.parse().unwrap())),
//                 "Range" => Ok(OpCode::Range),
//                 "List" => Ok(OpCode::List(rest.parse().unwrap())),
//                 "SetIndex" => Ok(OpCode::SetIndex),
//                 "GetIndex" => Ok(OpCode::GetIndex),
//
//                 "For" => Ok(OpCode::For(rest.parse().unwrap())),
//                 "ForInit" => Ok(OpCode::ForInit),
//                 "Jump" => Ok(OpCode::Jump(rest.parse().unwrap())),
//
//                 //native
//                 "Print" => Ok(OpCode::Print),
//                 "Xor" => Ok(OpCode::Xor),
//                 "Exit" => Ok(OpCode::Exit),
//                 _ => panic!("cant find {}", code),
//             }
//         } else {
//             panic!("not valid bytecode");
//         }
//     }
// }
