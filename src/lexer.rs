use std::{fmt::Display, str::Chars};

pub struct Lexer<'a> {
    chars: std::iter::Peekable<Chars<'a>>,
}

impl<'a> Lexer<'a> {
    pub fn new(src: &'a str) -> Self {
        Self {
            chars: src.chars().peekable(),
        }
    }
}

impl<'a> Iterator for Lexer<'a> {
    type Item = Token;

    fn next(&mut self) -> Option<Self::Item> {
        while let Some(c) = self.chars.next() {
            if c.is_whitespace() {
                continue;
            }
            let two_char_token = if let Some(next_c) = self.chars.peek() {
                match (c, next_c) {
                    ('!', '=') => Some(Token::BangEqual),
                    ('=', '=') => Some(Token::EqualEqual),
                    ('>', '=') => Some(Token::GreaterEqual),
                    ('<', '=') => Some(Token::LessEqual),
                    _ => None,
                }
            } else {
                None
            };

            if let Some(token) = two_char_token {
                self.chars.next();
                return Some(token);
            } else {
                let token = match c {
                    'a'..='z' | 'A'..='Z' => {
                        let mut buf = String::new();
                        buf.push(c);
                        while self.chars.peek().is_some_and(|x| {
                            x.is_ascii_alphabetic() || x.is_ascii_digit() || *x == '_'
                        }) {
                            buf.push(self.chars.next().unwrap())
                        }
                        if let Some(keyword) = keywords(&buf) {
                            keyword
                        } else {
                            Token::Identifier(buf)
                        }
                    }
                    '0'..='9' => {
                        let mut buf = String::new();
                        buf.push(c);

                        while self
                            .chars
                            .peek()
                            .is_some_and(|x| x.is_ascii_digit() || *x == '.')
                        {
                            buf.push(self.chars.next().unwrap())
                        }
                        if buf.contains(".") {
                            Token::FloatValue(buf.parse().expect("should be a valid float"))
                        } else {
                            Token::IntValue(buf.parse().expect("should be a valid int"))
                        }
                    }
                    '"' => {
                        let mut buf = String::new();
                        while self.chars.peek().is_some_and(|x| *x != '"') {
                            buf.push(self.chars.next().unwrap())
                        }
                        _ = self.chars.next();

                        Token::String(buf)
                    }
                    '(' => Token::LeftParen,
                    ')' => Token::RightParen,
                    '[' => Token::LeftBracket,
                    ']' => Token::RightBracket,
                    '{' => Token::LeftBrace,
                    '}' => Token::RightBrace,
                    '<' => Token::Less,
                    '>' => Token::Greater,
                    '=' => Token::Equal,
                    '+' => Token::Plus,
                    '-' => Token::Minus,
                    '/' => Token::Slash,
                    '*' => Token::Star,
                    '.' => Token::Dot,
                    ',' => Token::Comma,
                    ':' => Token::Colon,
                    ';' => Token::SemiColon,
                    '!' => Token::Bang,
                    '@' => Token::At,
                    '#' => Token::Hash,
                    _ => panic!("unknown token"),
                };
                return Some(token);
            }
        }
        None
    }
}

fn keywords(s: &str) -> Option<Token> {
    Some(match s {
        "class" => Token::Class,
        "and" => Token::And,
        "or" => Token::Or,
        "else" => Token::Else,
        "if" => Token::If,
        "for" => Token::For,
        "nil" => Token::Nil,
        "return" => Token::Return,
        "while" => Token::While,
        "import" => Token::Import,
        "true" => Token::BoolValue(true),
        "false" => Token::BoolValue(false),
        "def" => Token::Def,
        // types
        "int" => Token::Int,
        "float" => Token::Float,
        "bool" => Token::Bool,
        "str" => Token::Str,
        // "map" => TokenKind::Map,
        _ => return None,
    })
}

#[derive(Debug, PartialEq, Clone)]
pub enum Token {
    /// '('
    LeftParen,
    /// ')'
    RightParen,
    /// '['
    LeftBracket,
    /// ']'
    RightBracket,
    /// '{'
    LeftBrace,
    /// '}'
    RightBrace,
    /// '<'
    Less,
    /// '<='
    LessEqual,
    /// '>'
    Greater,
    /// '>='
    GreaterEqual,
    /// '='
    Equal,
    /// '=='
    EqualEqual,
    Bang,
    BangEqual,
    Class,
    Plus,
    Minus,
    Slash,
    Star,
    Dot,
    Comma,
    Colon,
    At,
    Hash,
    SemiColon,
    String(String),
    FloatValue(f32),
    IntValue(i32),
    Identifier(String),

    // types
    Int,
    Float,
    //Arr, // todo should this exist?
    Bool,
    Str,
    //Map,

    // keywords
    BoolValue(bool), // kindof...
    //Var,
    Def,
    And,
    Or,
    Else,
    If,
    For,
    Nil,
    Return,
    While,
    Import,
}

impl Display for Token {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Token::LeftParen => write!(f, "("),
            Token::RightParen => write!(f, ")"),
            Token::LeftBracket => write!(f, "["),
            Token::RightBracket => write!(f, "]"),
            Token::LeftBrace => write!(f, "{{"),
            Token::RightBrace => write!(f, "}}"),
            Token::Less => write!(f, "<"),
            Token::LessEqual => write!(f, "<="),
            Token::Greater => write!(f, ">"),
            Token::GreaterEqual => write!(f, ">="),
            Token::Equal => write!(f, "="),
            Token::EqualEqual => write!(f, "=="),
            Token::Bang => write!(f, "!"),
            Token::BangEqual => write!(f, "!="),
            Token::Class => write!(f, "class"),
            Token::Plus => write!(f, "+"),
            Token::Minus => write!(f, "-"),
            Token::Slash => write!(f, "/"),
            Token::Star => write!(f, "*"),
            Token::Dot => write!(f, "."),
            Token::Comma => write!(f, ","),
            Token::Colon => write!(f, ":"),
            Token::At => write!(f, "@"),
            Token::Hash => write!(f, "#"),
            Token::SemiColon => write!(f, ";"),
            Token::String(v) => write!(f, "{v}"),
            Token::FloatValue(v) => write!(f, "{}", v),
            Token::IntValue(v) => write!(f, "{}", v),
            Token::Identifier(v) => write!(f, "{}", v),
            Token::Int => write!(f, "int"),
            Token::Float => write!(f, "float"),
            Token::Bool => write!(f, "bool"),
            Token::Str => write!(f, "str"),
            //TokenKind::Map => write!(f, ""),
            Token::BoolValue(v) => write!(f, "{}", v),
            Token::Def => write!(f, "def"),
            Token::And => write!(f, "and"),
            Token::Or => write!(f, "or"),
            Token::Else => write!(f, "else"),
            Token::If => write!(f, "if"),
            Token::For => write!(f, "for"),
            Token::Nil => write!(f, "nil"),
            Token::Return => write!(f, "return"),
            Token::While => write!(f, "while"),
            Token::Import => write!(f, "import"),
        }
    }
}

#[test]
fn paren() {
    let mut lexer = Lexer::new("()");
    assert_eq!(lexer.next(), Some(Token::LeftParen));
    assert_eq!(lexer.next(), Some(Token::RightParen));
    assert_eq!(lexer.next(), None);
}

#[test]
fn str() {
    let mut lexer = Lexer::new("\"foo\"");
    assert_eq!(lexer.next(), Some(Token::String("foo".to_string())));
    assert_eq!(lexer.next(), None);
}

#[test]
fn two_and_single_char_tokens() {
    let mut lexer = Lexer::new("> >= < <= = != ==");
    assert_eq!(lexer.next(), Some(Token::Greater));
    assert_eq!(lexer.next(), Some(Token::GreaterEqual));
    assert_eq!(lexer.next(), Some(Token::Less));
    assert_eq!(lexer.next(), Some(Token::LessEqual));
    assert_eq!(lexer.next(), Some(Token::Equal));
    assert_eq!(lexer.next(), Some(Token::BangEqual));
    assert_eq!(lexer.next(), Some(Token::EqualEqual));
    assert_eq!(lexer.next(), None);
}

#[test]
fn keywords_and_types() {
    let mut lexer = Lexer::new("and or else if for nil return while import true false def");
    assert_eq!(lexer.next(), Some(Token::And));
    assert_eq!(lexer.next(), Some(Token::Or));
    assert_eq!(lexer.next(), Some(Token::Else));
    assert_eq!(lexer.next(), Some(Token::If));
    assert_eq!(lexer.next(), Some(Token::For));
    assert_eq!(lexer.next(), Some(Token::Nil));
    assert_eq!(lexer.next(), Some(Token::Return));
    assert_eq!(lexer.next(), Some(Token::While));
    assert_eq!(lexer.next(), Some(Token::Import));
    assert_eq!(lexer.next(), Some(Token::BoolValue(true)));
    assert_eq!(lexer.next(), Some(Token::BoolValue(false)));
    assert_eq!(lexer.next(), Some(Token::Def));
    assert_eq!(lexer.next(), None);
}

#[test]
#[should_panic]
fn parse_float_error() {
    let mut lexer = Lexer::new("1.2.3");
    lexer.next();
}
