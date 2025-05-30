#[derive(Debug, Clone)]
pub enum Node {
    Root(Vec<Node>),
    Neg(Box<Node>),
    Not(Box<Node>),
    Float(f32),
    Int(i32),
    String(String),
    GetField(String),
    SetField {
        name: String,
        expr: Box<Node>,
    },
    List {
        items: Vec<Node>,
    },
    Index {
        lhs: Box<Node>,
        indexer: Box<Node>,
    },
    IndexSet {
        lhs: Box<Node>,
        indexer: Box<Node>,
        rhs: Box<Node>,
    },
    Bool(bool),
    Nil,
    GetVar(String),
    Def {
        name: String,
        expr: Box<Node>,
    },
    Plus {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    Class {
        name: String,
        fields: Vec<Param>,
        functions: Vec<Function>,
    },
    Block {
        stmts: Vec<Node>,
    },
    Reassign {
        name: String,
        expr: Box<Node>,
    },
    Call {
        name: String,
        args: Vec<Node>,
    },
    Native {
        name: String,
        args: Vec<Node>,
    },
    Method {
        name: String,
        args: Vec<Node>,
        lhs: Option<Box<Node>>,
    },
    Pop {
        expr: Box<Node>,
    },
    EqualEqual {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    If {
        condition: Box<Node>,
        block: Box<Node>,
    },
    Return(Box<Node>),
    While {
        condition: Box<Node>,
        block: Box<Node>,
    },
    Or {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    And {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    BangEqual {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    Greater {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    GreaterEqual {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    Less {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    LessEqual {
        lhs: Box<Node>,
        rhs: Box<Node>,
    },
    Get {
        lhs: Box<Node>,
        field: String,
    },
    Set {
        lhs: Box<Node>,
        field: String,
        rhs: Box<Node>,
    },
}

#[derive(Debug, Clone)]
pub struct Function {
    pub name: String,
    pub params: Vec<Param>,
    pub block: Node,
}

#[derive(Debug, Clone)]
pub struct Param {
    pub name: String,
}

impl Node {
    pub fn pretty_print(&self, indent: &str, is_last: bool) {
        let marker = if is_last { "└── " } else { "├── " };
        print!("{}", indent);
        print!("{}", marker);

        match self {
            Node::Root(children) => {
                println!("Root");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                for (i, child) in children.iter().enumerate() {
                    child.pretty_print(&new_indent, i == children.len() - 1);
                }
            }
            Node::Neg(expr) => {
                println!("Neg");
                expr.pretty_print(
                    &(indent.to_string() + if is_last { "    " } else { "│   " }),
                    true,
                );
            }
            Node::Not(expr) => {
                println!("Not");
                expr.pretty_print(
                    &(indent.to_string() + if is_last { "    " } else { "│   " }),
                    true,
                );
            }
            Node::Float(n) => println!("Float({})", n),
            Node::Int(n) => println!("Int({})", n),
            Node::String(s) => println!("String(\"{}\")", s),
            Node::Bool(b) => println!("Bool({})", b),
            Node::Nil => println!("Nil"),
            Node::GetVar(name) => println!("GetVar({})", name),
            Node::Def { name, expr } => {
                println!("Def: {}", name);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                expr.pretty_print(&new_indent, true);
            }
            Node::Pop { expr } => {
                println!("Pop");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                expr.pretty_print(&new_indent, true);
            }
            Node::Plus { lhs, rhs } => {
                println!("Plus");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }

            Node::Index { lhs, indexer } => {
                println!("Index");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                indexer.pretty_print(&new_indent, true);
            }
            Node::IndexSet { lhs, indexer, rhs } => {
                println!("IndexSet");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                indexer.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::List { items } => {
                println!("List");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                for (i, elem) in items.iter().enumerate() {
                    elem.pretty_print(&new_indent, i == items.len() - 1);
                }
            }
            Node::Class {
                name,
                fields,
                functions,
            } => {
                println!("Class: {}", name);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });

                for (i, param) in fields.iter().enumerate() {
                    let is_last_field = functions.is_empty() && i == fields.len() - 1;
                    print!("{}", new_indent);
                    let marker = if is_last_field {
                        "└── "
                    } else {
                        "├── "
                    };
                    println!("{}Field: {}", marker, param.name);
                }

                for (i, func) in functions.iter().enumerate() {
                    let is_last_func = i == functions.len() - 1;
                    print!("{}", new_indent);
                    let marker = if is_last_func {
                        "└── "
                    } else {
                        "├── "
                    };
                    println!("{}Function: {}", marker, func.name);

                    let func_indent = format!(
                        "{}{}",
                        new_indent,
                        if is_last_func { "    " } else { "│   " }
                    );

                    for (j, param) in func.params.iter().enumerate() {
                        let is_last_param = j == func.params.len() - 1;
                        print!("{}", func_indent);
                        let marker = if is_last_param {
                            "└── "
                        } else {
                            "├── "
                        };
                        println!("{}Param: {}", marker, param.name);
                    }

                    // Function block
                    func.block.pretty_print(&func_indent, true);
                }
            }
            Node::Block { stmts } => {
                println!("Block");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                for (i, stmt) in stmts.iter().enumerate() {
                    stmt.pretty_print(&new_indent, i == stmts.len() - 1);
                }
            }
            Node::Reassign { name, expr } => {
                println!("Reassign: {}", name);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                expr.pretty_print(&new_indent, true);
            }
            Node::Call { name, args } => {
                println!("Call: {}", name);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                for (i, arg) in args.iter().enumerate() {
                    arg.pretty_print(&new_indent, i == args.len() - 1);
                }
            }
            Node::Native { name, args } => {
                println!("Native: {}", name);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                for (i, arg) in args.iter().enumerate() {
                    arg.pretty_print(&new_indent, i == args.len() - 1);
                }
            }
            Node::Method { name, args, lhs } => {
                println!("Method: {}", name);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                for (i, arg) in args.iter().enumerate() {
                    arg.pretty_print(&new_indent, lhs.is_none() && i == args.len() - 1);
                }
                if let Some(lhs) = lhs{
                    lhs.pretty_print(&new_indent, true);
                }
            }
            Node::EqualEqual { lhs, rhs } => {
                println!("EqualEqual");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::If { condition, block } => {
                println!("If");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                condition.pretty_print(&new_indent, false);
                block.pretty_print(&new_indent, true);
            }
            Node::Return(expr) => {
                println!("Return");
                expr.pretty_print(
                    &(indent.to_string() + if is_last { "    " } else { "│   " }),
                    true,
                );
            }
            Node::While { condition, block } => {
                println!("While");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                condition.pretty_print(&new_indent, false);
                block.pretty_print(&new_indent, true);
            }
            Node::Or { lhs, rhs } => {
                println!("Or");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::And { lhs, rhs } => {
                println!("And");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::BangEqual { lhs, rhs } => {
                println!("BangEqual");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::Greater { lhs, rhs } => {
                println!("Greater");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::GreaterEqual { lhs, rhs } => {
                println!("GreaterEqual");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::Less { lhs, rhs } => {
                println!("Less");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::LessEqual { lhs, rhs } => {
                println!("LessEqual");
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
            Node::GetField(s) => println!("Field(\"{}\")", s),
            Node::SetField { name, expr } => {
                println!("SetField({})", name);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                expr.pretty_print(&new_indent, true);
            }
            Node::Get { lhs, field } => {
                println!("Get({})", field);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, true);
            }
            Node::Set { lhs, field, rhs } => {
                println!("Set({})", field);
                let new_indent = format!("{}{}", indent, if is_last { "    " } else { "│   " });
                lhs.pretty_print(&new_indent, false);
                rhs.pretty_print(&new_indent, true);
            }
        }
    }
}
