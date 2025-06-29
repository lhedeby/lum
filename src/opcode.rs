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
        let mut split = s.split("|");
        match split.next() {
            Some("PushNil") => Ok(OpCode::PushNil),
            Some("Plus") => Ok(OpCode::Plus),
            Some("Minus") => Ok(OpCode::Minus),
            Some("Return") => Ok(OpCode::Return),
            Some("Pop") => Ok(OpCode::Pop),
            Some("Neg") => Ok(OpCode::Neg),
            Some("Not") => Ok(OpCode::Not),
            Some("Equals") => Ok(OpCode::Equals),
            Some("NotEquals") => Ok(OpCode::NotEquals),
            Some("Or") => Ok(OpCode::Or),
            Some("And") => Ok(OpCode::And),
            Some("Less") => Ok(OpCode::Less),
            Some("LessEqual") => Ok(OpCode::LessEqual),
            Some("Greater") => Ok(OpCode::Greater),
            Some("GreaterEqual") => Ok(OpCode::GreaterEqual),
            Some("IndexGet") => Ok(OpCode::IndexGet),
            Some("IndexSet") => Ok(OpCode::IndexSet),
            Some("PushSelf") => Ok(OpCode::PushSelf),
            // 1 param
            Some("JumpIfFalse") => Ok(OpCode::JumpIfFalse(split.next().unwrap().parse().unwrap())),
            Some("SetLocal") => Ok(OpCode::SetLocal(split.next().unwrap().parse().unwrap())),
            Some("GetLocal") => Ok(OpCode::GetLocal(split.next().unwrap().parse().unwrap())),
            Some("Jump") => Ok(OpCode::Jump(split.next().unwrap().parse().unwrap())),
            Some("Native") => Ok(OpCode::Native(split.next().unwrap().parse().unwrap())),
            Some("PushString") => Ok(OpCode::PushString(split.next().unwrap().parse().unwrap())),
            Some("List") => Ok(OpCode::List(split.next().unwrap().parse().unwrap())),
            Some("GetField") => Ok(OpCode::GetField(split.next().unwrap().to_string())),
            Some("SetField") => Ok(OpCode::SetField(split.next().unwrap().to_string())),
            Some("Get") => Ok(OpCode::Get(split.next().unwrap().to_string())),
            Some("Set") => Ok(OpCode::Set(split.next().unwrap().to_string())),
            Some("PushInt") => Ok(OpCode::PushInt(split.next().unwrap().parse().unwrap())),
            Some("PushBool") => Ok(OpCode::PushBool(split.next().unwrap().parse().unwrap())),
            Some("PushFloat") => Ok(OpCode::PushFloat(split.next().unwrap().parse().unwrap())),
            Some("Print") => Ok(OpCode::Print(split.next().unwrap().parse().unwrap())),
            // 2 param
            Some("Call") => {
                let l1 = split.next().unwrap().to_string();
                let l2 = split.next().unwrap().parse().unwrap();
                Ok(OpCode::Call(l1, l2))
            }
            // 3 param
            Some("Instance") => {
                let l1 = split
                    .next()
                    .unwrap()
                    .split(",")
                    .map(|x| x.to_string())
                    .filter(|x| x != "")
                    .collect::<Vec<String>>();
                let l2 = split
                    .next()
                    .unwrap()
                    .split(",")
                    .map(|x| x.to_string())
                    .filter(|x| x != "")
                    .collect::<Vec<String>>();
                let l3 = split
                    .next()
                    .unwrap()
                    .split(",")
                    .filter_map(|x| x.parse().ok())
                    .collect::<Vec<usize>>();
                Ok(OpCode::Instance(l1, l2, l3))
            }
            Some(code) => panic!("unexpected opcode {}", code),
            None => panic!("iterator is empty"),
        }
    }
}
