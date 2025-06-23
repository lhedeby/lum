use std::iter::Peekable;

use crate::{
    lexer::{Lexer, Token},
    node::{Method, Node},
};

pub struct Parser<'a> {
    lexer: Peekable<Lexer<'a>>,
    src: &'a str,
}

impl Parser<'_> {
    pub fn parse_file(src_file: &str) -> Node {
        match std::fs::read_to_string(src_file) {
            Ok(content) => {
                println!("read conent in rust: {}", content);
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
        println!("next token: {:?}", self.lexer.peek());
        if let Some(token) = self.lexer.peek() {
            match token {
                Token::LeftBrace => self.block(),
                Token::Def => self.def(),
                Token::LeftBracket => self.list(),
                Token::Class => self.class(),
                Token::Identifier(_) => {
                    let expr = self.expr();
                    match expr {
                        Node::Method { .. } | Node::Instance { .. } | Node::Get { .. } => {
                            Node::Pop {
                                expr: Box::new(expr),
                            }
                        }
                        n => n,
                    }
                }
                Token::If => self.stmt_if(),
                Token::For => self.stmt_for(),
                Token::While => self.stmt_while(),
                Token::Return => self.stmt_return(),
                Token::At => self.stmt_set_field(),
                Token::Hash => {
                    _ = self.lexer.next();
                    Node::Pop {
                        expr: Box::new(self.native()),
                    }
                }
                Token::Import => self.import(),
                t => panic!("Unexpected token '{}' in stmt()", t),
            }
        } else {
            panic!("unexpected end of tokens")
        }
    }

    fn import(&mut self) -> Node {
        self.consume(Token::Import);
        self.consume(Token::LeftBrace);
        let mut imports = vec![];
        loop {
            match self.lexer.next() {
                Some(Token::String(s)) => {
                    let mut iter = self.src.split("/").peekable();
                    let mut path_buf = String::new();

                    while let Some(part) = iter.next() {
                        if iter.peek().is_some() {
                            path_buf.push_str(part);
                            path_buf.push('/');
                        }
                    }

                    path_buf.push_str(&s);
                    imports.push(Parser::parse_file(&path_buf));
                }
                Some(Token::Comma) => {}
                Some(Token::RightBrace) => break,
                Some(t) => panic!("undexpected token {}", t),
                None => break,
            }
        }
        Node::Block { stmts: imports }
    }

    fn native(&mut self) -> Node {
        let name = self.consume_identifier();

        self.consume(Token::LeftParen);

        let mut args = vec![];
        if self.lexer.peek() != Some(&Token::RightParen) {
            loop {
                args.push(self.expr());
                match self.lexer.peek() {
                    Some(Token::Comma) => _ = self.lexer.next(),
                    Some(Token::RightParen) => {
                        break;
                    }
                    actual => panic!("expected ',' or ')' but got '{:?}'", actual),
                }
            }
        }
        _ = self.lexer.next();
        Node::Native { name, args }
    }

    fn stmt_set_field(&mut self) -> Node {
        _ = self.lexer.next();
        let name = self.consume_identifier();
        match self.lexer.next() {
            Some(Token::Equal) => Node::SetField {
                name,
                expr: Box::new(self.expr()),
            },
            Some(Token::LeftParen) => Node::Pop {
                expr: Box::new(self.call(Node::GetField(name))),
            },
            Some(Token::LeftBracket) => {
                let indexer = self.expr();
                self.consume(Token::RightBracket);
                self.consume(Token::Equal);
                let rhs = self.expr();
                Node::IndexSet {
                    lhs: Box::new(Node::GetField(name)),
                    indexer: Box::new(indexer),
                    rhs: Box::new(rhs),
                }
            }
            Some(token) => panic!("Unexpected token '{}', expected '='", token),
            None => panic!("Unexpected end of tokens"),
        }
    }

    fn stmt_for(&mut self) -> Node {
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
        self.consume(Token::Def);
        let name = self.consume_identifier();

        self.consume(Token::Equal);

        let expr = self.expr();
        Node::Def {
            name,
            expr: Box::new(expr),
        }
    }

    fn block(&mut self) -> Node {
        self.consume(Token::LeftBrace);

        let mut stmts = vec![];

        while let Some(token) = self.lexer.peek() {
            match token {
                Token::RightBrace => break,
                _ => stmts.push(self.stmt()),
            }
        }
        self.consume(Token::RightBrace);

        Node::Block { stmts }
    }

    fn class(&mut self) -> Node {
        _ = self.lexer.next();
        let name = self.consume_identifier();

        let fields = match self.lexer.peek() {
            Some(Token::LeftParen) => self.param_list(),
            Some(Token::LeftBrace) => vec![],
            _ => panic!("expected '(' or '{{'"),
        };

        self.consume(Token::LeftBrace);
        let mut methods = vec![];
        if self.lexer.peek() != Some(&Token::RightBrace) {
            loop {
                let name = self.consume_identifier();

                let params = match self.lexer.peek() {
                    Some(Token::LeftParen) => self.param_list(),
                    Some(_) => vec![],
                    None => panic!("unexpected end of tokens"),
                };

                let block = self.block();

                methods.push(Method {
                    name,
                    params,
                    block,
                });
                match self.lexer.peek() {
                    Some(Token::RightBrace) => {
                        break;
                    }
                    _ => {}
                }
            }
        }
        self.consume(Token::RightBrace);
        Node::Class {
            name,
            fields,
            methods,
        }
    }

    fn param_list(&mut self) -> Vec<String> {
        self.consume(Token::LeftParen);
        let mut params = vec![];
        if self.lexer.peek() != Some(&Token::RightParen) {
            loop {
                let name = self.consume_identifier();

                params.push(name);
                match self.lexer.peek() {
                    Some(Token::Comma) => _ = self.lexer.next(),
                    Some(Token::RightParen) => {
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
        self.parse_expr(0)
    }
    fn parse_expr(&mut self, precedence: usize) -> Node {
        let mut lhs = self.parse_prefix();
        // todo: This is some wierd hack to handle eof
        while precedence < infix_precedence(self.lexer.peek().unwrap_or(&Token::SemiColon)) {
            lhs = self.parse_infix(lhs);
        }
        lhs
    }

    fn parse_infix(&mut self, mut lhs: Node) -> Node {
        while let Some(token) = self.lexer.peek().cloned() {
            match token {
                Token::LeftParen => {
                    self.consume(Token::LeftParen);
                    lhs = self.call(lhs);
                }
                Token::LeftBracket => {
                    self.consume(Token::LeftBracket);
                    lhs = self.index(lhs);
                }
                Token::Dot => {
                    self.consume(Token::Dot);
                    lhs = self.get_or_set(lhs);
                }
                _ => {
                    // If it's not a postfix, it's an infix or done
                    let next_precedence = infix_precedence(&token);
                    if next_precedence == 0 {
                        // Not an infix operator (or very low precedence) — done
                        break;
                    }

                    _ = self.lexer.next(); // consume infix token
                    let rhs = self.parse_expr(next_precedence);

                    lhs = match token {
                        Token::Or => Node::Or {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::And => Node::And {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::BangEqual => Node::BangEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::EqualEqual => Node::EqualEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::Greater => Node::Greater {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::GreaterEqual => Node::GreaterEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::Less => Node::Less {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::LessEqual => Node::LessEqual {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::Plus => Node::Plus {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::Minus => Node::Minus {
                            lhs: Box::new(lhs),
                            rhs: Box::new(rhs),
                        },
                        Token::Equal => match lhs {
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
                        _ => panic!("Unexpected infix token: {}", token),
                    };
                }
            }
        }

        lhs
    }
    fn parse_prefix(&mut self) -> Node {
        match self.lexer.next().unwrap() {
            Token::Minus => Node::Neg(Box::new(self.parse_expr(prefix_precedence()))),
            Token::Bang => Node::Not(Box::new(self.parse_expr(prefix_precedence()))),
            Token::LeftBracket => self.list(),
            Token::Identifier(name) => self.identifier(name),
            Token::IntValue(v) => Node::Int(v),
            Token::FloatValue(v) => Node::Float(v),
            Token::String(s) => Node::String(s),
            Token::BoolValue(b) => Node::Bool(b),
            Token::Nil => Node::Nil,
            Token::At => self.field(),
            Token::Hash => self.native(),
            Token::LeftParen => self.grouping(),
            t => {
                panic!("Unexpected token {} in parse_prefix()", t)
            }
        }
    }

    fn field(&mut self) -> Node {

        match self.lexer.peek() {
            Some(Token::Identifier(_)) => {
                let name = self.consume_identifier();
                Node::GetField(name)
            },
            Some(_) => return Node::GetSelf,
            None => panic!("unexpected end of tokens")
        }
    }

    fn call(&mut self, lhs: Node) -> Node {
        let mut args = vec![];
        if self.lexer.peek() != Some(&Token::RightParen) {
            loop {
                args.push(self.expr());
                match self.lexer.peek() {
                    Some(Token::Comma) => _ = self.lexer.next(),
                    Some(Token::RightParen) => {
                        break;
                    }
                    _ => panic!("expected ',' or ')'"),
                }
            }
        }
        _ = self.lexer.next();

        match lhs {
            // native or instance
            Node::GetVar(name) => Node::Instance { name, args },
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
            n => panic!("lhs should be getvar or get but got '{:?}'", n),
        }
    }
    fn index(&mut self, lhs: Node) -> Node {
        let expr = self.expr();
        self.consume(Token::RightBracket);
        Node::Index {
            lhs: Box::new(lhs),
            indexer: Box::new(expr),
        }
    }
    fn get_or_set(&mut self, lhs: Node) -> Node {
        let field = self.consume_identifier();
        Node::Get {
            lhs: Box::new(lhs),
            field,
        }
    }

    fn list(&mut self) -> Node {
        let mut items = vec![];
        if self.lexer.peek() != Some(&Token::RightBracket) {
            loop {
                items.push(self.expr());
                match self.lexer.peek() {
                    Some(Token::Comma) => _ = self.lexer.next(),
                    Some(Token::RightBracket) => {
                        break;
                    }
                    _ => panic!("expected ',' or ']'"),
                }
            }
        }
        _ = self.lexer.next();

        Node::List { items }
    }
    fn identifier(&mut self, name: String) -> Node {
        Node::GetVar(name)
    }
    fn grouping(&mut self) -> Node {
        let node = self.expr();
        self.consume(Token::RightParen);
        node
    }

    /// Consumes the next token in the lexer iterator. Panics if not of the correct kind
    fn consume(&mut self, token: Token) {
        match self.lexer.next() {
            Some(actual) if actual == token => {}
            Some(t) => panic!("Expected '{}' but got '{}'", token, t),
            None => panic!("Unexpected end of tokens"),
        }
    }

    /// Consumes the next identifier and returns the string.
    /// If the token is not an identifier, panics.
    fn consume_identifier(&mut self) -> String {
        match self.lexer.next() {
            Some(Token::Identifier(s)) => s,
            Some(t) => panic!("Expected identifier but got '{}'", t),
            None => panic!("Unexpected end of tokens"),
        }
    }
}

fn infix_precedence(kind: &Token) -> usize {
    match kind {
        Token::Equal => 1,
        Token::Or => 3,
        Token::And => 4,
        Token::BangEqual | Token::EqualEqual => 5,
        Token::Greater | Token::GreaterEqual | Token::Less | Token::LessEqual => 6,
        Token::Plus | Token::Minus => 7,
        Token::Star | Token::Slash => 8,
        Token::LeftParen | Token::LeftBracket => 10,
        Token::Dot => 11,
        _ => 0,
    }
}

fn prefix_precedence() -> usize {
    9
}
