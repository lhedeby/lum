use std::iter::Peekable;

use crate::{
    lexer::{Lexer, TokenKind},
    node::{Function, Node, Param, Type},
};

pub struct Parser<'a> {
    lexer: Peekable<Lexer<'a>>,
    src: &'a str,
}

impl Parser<'_> {
    pub fn parse_file(src_file: &str) -> Node {
        match std::fs::read_to_string(src_file) {
            Ok(content) => {
                let mut parser = Parser {
                    lexer: Lexer::new(&content).peekable(),
                    src: src_file,
                };
                parser.parse_root()
            }
            Err(e) => panic!("Parser error: {}", e),
        }
    }
    pub fn parse_code(src: &str) -> Node {
        let mut parser = Parser {
            lexer: Lexer::new(&src).peekable(),
            src,
        };
        parser.parse_root()
    }

    fn parse_root(&mut self) -> Node {
        let mut root_vec = vec![];

        while let Some(_) = self.lexer.peek() {
            root_vec.push(self.stmt());
        }

        Node::Root(root_vec)
    }

    fn stmt(&mut self) -> Node {
        if let Some(token) = self.lexer.peek() {
            let node = match token {
                TokenKind::LeftBrace => self.block(),
                TokenKind::Def => self.def(),
                TokenKind::LeftBracket => self.list(),
                TokenKind::Class => self.class(),
                TokenKind::Identifier(_) => {
                    let expr = self.expr();
                    match expr {
                        Node::Method { .. } | Node::Call { .. } => Node::Pop {
                            expr: Box::new(expr),
                        },
                        n => n,
                    }
                }
                TokenKind::If => self.stmt_if(),
                TokenKind::For => self.stmt_for(),
                TokenKind::While => self.stmt_while(),
                TokenKind::Return => self.stmt_return(),
                TokenKind::At => self.stmt_set_field(),
                t => panic!("Unexpected token '{:?}' in stmt()", t),
            };
            node
        } else {
            panic!("unexpected end of tokens")
        }
    }

    fn stmt_set_field(&mut self) -> Node {
        _ = self.lexer.next();
        let name = match self.lexer.next() {
            Some(TokenKind::Identifier(name)) => name,
            _ => panic!("expected identifier"),
        };
        match self.lexer.next() {
            Some(TokenKind::Equal) => Node::SetField {
                name,
                expr: Box::new(self.expr()),
            },
            Some(TokenKind::LeftParen) => self.call(Node::GetField(name)),
            t => panic!("Unexpected token '{:?}', expected '='", t),
        }
    }

    fn stmt_for(&mut self) -> Node {
        println!("TOKEN: {:?}", self.lexer.peek().unwrap());
        todo!("FOR")
    }
    fn stmt_while(&mut self) -> Node {
        _ = self.lexer.next();
        Node::While {
            condition: Box::new(self.expr()),
            block: Box::new(self.block()),
        }
    }

    fn stmt_return(&mut self) -> Node {
        _ = self.lexer.next();
        let expr = self.expr();
        Node::Return(Box::new(expr))
    }

    fn stmt_if(&mut self) -> Node {
        _ = self.lexer.next();
        let expr = self.expr();

        let block = self.block();
        Node::If {
            condition: Box::new(expr),
            block: Box::new(block),
        }
    }

    fn def(&mut self) -> Node {
        match self.lexer.next() {
            Some(TokenKind::Def) => {}
            _ => unreachable!(),
        };
        let name = match self.lexer.next() {
            Some(TokenKind::Identifier(name)) => name,
            _ => panic!("expected identifier"),
        };

        match self.lexer.next() {
            Some(TokenKind::Equal) => {}
            _ => panic!("expected equal"),
        };

        let expr = self.expr();
        Node::Def {
            name,
            expr: Box::new(expr),
        }
    }

    fn var_type(&mut self) -> Option<Type> {
        let kind = match self.lexer.peek() {
            Some(TokenKind::Int) => Type::Int,
            Some(TokenKind::Float) => Type::Float,
            Some(TokenKind::Bool) => Type::Bool,
            Some(TokenKind::Str) => Type::String,
            Some(TokenKind::Map) => Type::Map,
            Some(TokenKind::Identifier(name)) => Type::Class(name.to_string()),
            _ => return None,
        };
        _ = self.lexer.next();
        Some(kind)
    }

    fn block(&mut self) -> Node {
        match self.lexer.next() {
            Some(TokenKind::LeftBrace) => {}
            t => panic!("expected 'leftbrace' but got '{:?}'", t),
        }

        let mut stmts = vec![];

        while let Some(token) = self.lexer.peek() {
            match token {
                TokenKind::RightBrace => break,
                _ => stmts.push(self.stmt()),
            }
        }
        match self.lexer.next() {
            Some(TokenKind::RightBrace) => {}
            _ => panic!("should be right brace"),
        }
        Node::Block { stmts }
    }

    fn class(&mut self) -> Node {
        _ = self.lexer.next();
        let name = match self.lexer.next() {
            Some(TokenKind::Identifier(name)) => name,
            _ => panic!("expected identifier"),
        };

        let fields = match self.lexer.peek() {
            Some(TokenKind::LeftParen) => self.param_list(),
            Some(TokenKind::LeftBrace) => vec![],
            _ => panic!("expected '(' or '{{'")
        };
        //let fields = self.param_list();

        match self.lexer.next() {
            Some(TokenKind::LeftBrace) => {}
            _ => panic!("expected 'leftbrace'"),
        }
        let mut functions = vec![];
        if self.lexer.peek() != Some(&TokenKind::RightBrace) {
            loop {
                let name = match self.lexer.next() {
                    Some(TokenKind::Identifier(name)) => name,
                    t => panic!("expected identifier {:?}", t),
                };

                let params = match self.lexer.peek() {
                    Some(TokenKind::LeftParen) => self.param_list(),
                    Some(TokenKind::LeftBrace) => vec![],
                    _ => panic!("expected '(' or '{{'")
                };
                //let params = self.param_list();
                let return_kind = self.var_type();

                let block = self.block();

                functions.push(Function {
                    name,
                    params,
                    block,
                    return_kind,
                });
                match self.lexer.peek() {
                    Some(TokenKind::RightBrace) => {
                        break;
                    }
                    _ => {}
                }
            }
        }
        match self.lexer.next() {
            Some(TokenKind::RightBrace) => {}
            _ => panic!("expected right brace"),
        }
        Node::Class {
            name,
            fields,
            functions,
        }
    }

    fn param_list(&mut self) -> Vec<Param> {
        match self.lexer.next() {
            Some(TokenKind::LeftParen) => {}
            _ => panic!("expected '('"),
        }
        let mut params = vec![];
        if self.lexer.peek() != Some(&TokenKind::RightParen) {
            loop {
                let kind = self.var_type().expect("must have type");
                let name = match self.lexer.next() {
                    Some(TokenKind::Identifier(name)) => name,
                    _ => panic!("expected identifier"),
                };

                params.push(Param { name, kind });
                match self.lexer.peek() {
                    Some(TokenKind::Comma) => _ = self.lexer.next(),
                    Some(TokenKind::RightParen) => {
                        break;
                    }
                    _ => panic!("expected ',' or ')'"),
                }
            }
        }
        _ = self.lexer.next();
        params
    }

    fn expr(&mut self) -> Node {
        let node = self.parse_expr(0);
        node
    }
    fn parse_expr(&mut self, precedence: usize) -> Node {
        let mut lhs = self.parse_prefix();
        while precedence < infix_precedence(self.lexer.peek().unwrap_or(&TokenKind::SemiColon)) {
            lhs = self.parse_infix(lhs);
        }
        lhs
    }

    fn parse_infix(&mut self, mut lhs: Node) -> Node {
        while let Some(token) = self.lexer.peek().cloned() {
            match token {
                TokenKind::LeftParen => {
                    self.lexer.next(); // consume '('
                    lhs = self.call(lhs);
                }
                TokenKind::LeftBracket => {
                    self.lexer.next(); // consume '['
                    lhs = self.index(lhs);
                }
                TokenKind::Dot => {
                    self.lexer.next(); // consume '.'
                    lhs = self.get_or_set(lhs);
                }
                _ => {
                    // If it's not a postfix, it's an infix or done
                    let next_precedence = infix_precedence(&token);
                    if next_precedence == 0 {
                        // Not an infix operator (or very low precedence) — done
                        break;
                    }

                    self.lexer.next(); // consume infix token
                    let rhs = self.parse_expr(next_precedence);

                    lhs = match token {
                        TokenKind::Or => Node::Or {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::And => Node::And {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::BangEqual => Node::BangEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::EqualEqual => Node::EqualEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::Greater => Node::Greater {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::GreaterEqual => Node::GreaterEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::Less => Node::Less {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::LessEqual => Node::LessEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::Plus => Node::Plus {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        TokenKind::Equal => match lhs {
                            Node::Get { lhs, field } => Node::Set {
                                lhs,
                                field,
                                rhs: Box::new(rhs),
                            },
                            Node::GetVar(s) => Node::Reassign {
                                name: s,
                                expr: Box::new(rhs),
                            },
                            Node::Index { lhs, indexer } => Node::IndexSet {
                                lhs,
                                indexer,
                                rhs: Box::new(rhs),
                            },
                            _ => panic!("equal infix, dunno if this is possible?"),
                        },
                        // TODO: Fill in others (Star, Slash, Minus, Equal)
                        _ => panic!("Unexpected infix token: {:?}", token),
                    };
                }
            }
        }

        lhs
    }
    fn parse_prefix(&mut self) -> Node {
        match self.lexer.next().unwrap() {
            TokenKind::Minus => Node::Neg(Box::new(self.parse_expr(prefix_precedence()))),
            TokenKind::Bang => Node::Not(Box::new(self.parse_expr(prefix_precedence()))),
            TokenKind::LeftBracket => self.list(),
            TokenKind::Identifier(name) => self.identifier(name),
            TokenKind::IntValue(v) => Node::Int(v),
            TokenKind::FloatValue(v) => Node::Float(v),
            TokenKind::String(s) => Node::String(s),
            TokenKind::BoolValue(b) => Node::Bool(b),
            TokenKind::Nil => Node::Nil,
            TokenKind::At => self.field(),
            //TokenKind::Fun => Function(),
            TokenKind::LeftParen => self.grouping(),
            //TokenKind::LeftBrace => Obj(),
            //TokenKind::Import => Import(),
            // Todo: should types be included here?
            t => panic!("Unexpected token {:?} in parse_prefix()", t),
        }
    }

    fn field(&mut self) -> Node {
        match self.lexer.next() {
            Some(TokenKind::Identifier(name)) => Node::GetField(name),
            _ => panic!("expected identifier"),
        }
    }

    fn call(&mut self, lhs: Node) -> Node {
        let mut args = vec![];
        if self.lexer.peek() != Some(&TokenKind::RightParen) {
            loop {
                args.push(self.expr());
                match self.lexer.peek() {
                    Some(TokenKind::Comma) => _ = self.lexer.next(),
                    Some(TokenKind::RightParen) => {
                        break;
                    }
                    _ => panic!("expected ',' or ')'"),
                }
            }
        }
        _ = self.lexer.next();

        match lhs {
            // native or instance
            Node::GetVar(name) => Node::Call { name, args },
            Node::Get { lhs, field } => Node::Method {
                name: field,
                args,
                lhs: Some(lhs),
            },
            Node::GetField(name) => Node::Method {
                name: name,
                args,
                lhs: None,
            },
            v => panic!("lhs should be getvar or get but got '{:?}'", v),
        }
    }
    fn index(&mut self, lhs: Node) -> Node {
        let expr = self.expr();
        match self.lexer.next() {
            Some(TokenKind::RightBracket) => {}
            _ => panic!("expected right bracket"),
        }
        Node::Index {
            lhs: Box::new(lhs),
            indexer: Box::new(expr),
        }
        //todo!()
    }
    fn get_or_set(&mut self, lhs: Node) -> Node {
        match self.lexer.next() {
            Some(TokenKind::Identifier(field)) => Node::Get {
                lhs: Box::new(lhs),
                field,
            },
            _ => panic!("expected identifier"),
        }
    }
    fn list(&mut self) -> Node {
        let mut items = vec![];
        if self.lexer.peek() != Some(&TokenKind::RightBracket) {
            loop {
                items.push(self.expr());
                match self.lexer.peek() {
                    Some(TokenKind::Comma) => _ = self.lexer.next(),
                    Some(TokenKind::RightBracket) => {
                        break;
                    }
                    _ => panic!("expected ',' or ']'"),
                }
            }
        }
        _ = self.lexer.next();
        match self.lexer.next() {
            Some(TokenKind::Less) => {}
            _ => panic!("expected '<'"),
        }
        let kind = match self.var_type() {
            Some(s) => s,
            None => panic!("expected type"),
        };

        match self.lexer.next() {
            Some(TokenKind::Greater) => {}
            _ => panic!("expected '>'"),
        }
        Node::List { items, kind }

        //panic!("here")
        // if self.lexer.peek() == Some(&TokenKind::RightBracket) {
        //     println!("here!!!!!!!!!!!!!!");
        //     _ = self.lexer.next();
        //     let kind = match self.lexer.next() {
        //         Some(TokenKind::Identifier(name)) => Type::Class(name),
        //         Some(TokenKind::Int) => Type::Int,
        //         Some(TokenKind::Bool) => Type::Int,
        //         Some(TokenKind::Float) => Type::Int,
        //         Some(TokenKind::Str) => Type::String,
        //         _ => panic!("not a type"),
        //     };
        //     Node::List {
        //         items: vec![],
        //         kind: Some(kind),
        //     }
        // } else {
        //     loop {
        //         items.push(self.expr());
        //         match self.lexer.peek() {
        //             Some(TokenKind::Comma) => _ = self.lexer.next(),
        //             Some(TokenKind::RightBracket) => {
        //                 _ = self.lexer.next();
        //                 break;
        //             }
        //             _ => panic!("expected ',' or ']'"),
        //         }
        //     }
        //     Node::List { items, kind: None }
        // }
    }
    fn identifier(&mut self, name: String) -> Node {
        Node::GetVar(name)
    }
    fn grouping(&mut self) -> Node {
        let node = self.expr();
        match self.lexer.next() {
            Some(TokenKind::RightParen) => node,
            _ => panic!("Expected ')'"),
        }
    }
}

fn infix_precedence(kind: &TokenKind) -> usize {
    match kind {
        TokenKind::Equal => 1,
        TokenKind::Or => 3,
        TokenKind::And => 4,
        TokenKind::BangEqual | TokenKind::EqualEqual => 5,
        TokenKind::Greater | TokenKind::GreaterEqual | TokenKind::Less | TokenKind::LessEqual => 6,
        TokenKind::Plus | TokenKind::Minus => 7,
        TokenKind::Star | TokenKind::Slash => 8,
        // TokenKind::Colon
        TokenKind::LeftParen | TokenKind::LeftBracket => 10,
        TokenKind::Dot => 11,
        _ => 0,
    }
}

fn prefix_precedence() -> usize {
    9
}
