use std::str::Chars;

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
    type Item = TokenKind;

    fn next(&mut self) -> Option<Self::Item> {
        while let Some(c) = self.chars.next() {
            if c.is_whitespace() {
                continue;
            }
            let two_char_token = if let Some(next_c) = self.chars.peek() {
                match (c, next_c) {
                    ('!', '=') => Some(TokenKind::BangEqual),
                    ('=', '=') => Some(TokenKind::EqualEqual),
                    ('>', '=') => Some(TokenKind::GreaterEqual),
                    ('<', '=') => Some(TokenKind::LessEqual),
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
                            TokenKind::Identifier(buf)
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
                            TokenKind::FloatValue(buf.parse().expect("should be a valid float"))
                        } else {
                            TokenKind::IntValue(buf.parse().expect("should be a valid int"))
                        }
                    }
                    '"' => {
                        let mut buf = String::new();
                        while self.chars.peek().is_some_and(|x| *x != '"') {
                            buf.push(self.chars.next().unwrap())
                        }
                        _ = self.chars.next();

                        TokenKind::String(buf)
                    }
                    '(' => TokenKind::LeftParen,
                    ')' => TokenKind::RightParen,
                    '[' => TokenKind::LeftBracket,
                    ']' => TokenKind::RightBracket,
                    '{' => TokenKind::LeftBrace,
                    '}' => TokenKind::RightBrace,
                    '<' => TokenKind::Less,
                    '>' => TokenKind::Greater,
                    '=' => TokenKind::Equal,
                    '+' => TokenKind::Plus,
                    '-' => TokenKind::Minus,
                    '/' => TokenKind::Slash,
                    '*' => TokenKind::Star,
                    '.' => TokenKind::Dot,
                    ',' => TokenKind::Comma,
                    ':' => TokenKind::Colon,
                    ';' => TokenKind::SemiColon,
                    '!' => TokenKind::Bang,
                    '@' => TokenKind::At,
                    _ => panic!("unknown token"),
                };
                return Some(token);
            }
        }
        None
    }
}

fn keywords(s: &str) -> Option<TokenKind> {
    Some(match s {
        "class" => TokenKind::Class,
        "and" => TokenKind::And,
        "or" => TokenKind::Or,
        "else" => TokenKind::Else,
        "if" => TokenKind::If,
        "for" => TokenKind::For,
        "fun" => TokenKind::Fun,
        "nil" => TokenKind::Nil,
        "return" => TokenKind::Return,
        "while" => TokenKind::While,
        "import" => TokenKind::Import,
        "true" => TokenKind::BoolValue(true),
        "false" => TokenKind::BoolValue(false),
        "def" => TokenKind::Def,
        // types
        "int" => TokenKind::Int,
        "float" => TokenKind::Float,
        //"arr" => TokenKind::Arr,
        "bool" => TokenKind::Bool,
        "str" => TokenKind::Str,
        "map" => TokenKind::Map,
        _ => return None,
    })
}

#[derive(Debug, PartialEq, Clone)]
pub enum TokenKind {
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
    Map,

    // keywords
    BoolValue(bool), // kindof...
    //Var,
    Def,
    And,
    Or,
    Else,
    If,
    For,
    Fun,
    Nil,
    Return,
    While,
    Import,

}

#[test]
fn paren() {
    let mut lexer = Lexer::new("()");
    assert_eq!(lexer.next(), Some(TokenKind::LeftParen));
    assert_eq!(lexer.next(), Some(TokenKind::RightParen));
    assert_eq!(lexer.next(), None);
}

#[test]
fn str() {
    let mut lexer = Lexer::new("\"foo\"");
    assert_eq!(lexer.next(), Some(TokenKind::String("foo".to_string())));
    assert_eq!(lexer.next(), None);
}

#[test]
fn two_and_single_char_tokens() {
    let mut lexer = Lexer::new("> >= < <= = != ==");
    assert_eq!(lexer.next(), Some(TokenKind::Greater));
    assert_eq!(lexer.next(), Some(TokenKind::GreaterEqual));
    assert_eq!(lexer.next(), Some(TokenKind::Less));
    assert_eq!(lexer.next(), Some(TokenKind::LessEqual));
    assert_eq!(lexer.next(), Some(TokenKind::Equal));
    assert_eq!(lexer.next(), Some(TokenKind::BangEqual));
    assert_eq!(lexer.next(), Some(TokenKind::EqualEqual));
    assert_eq!(lexer.next(), None);
}


#[test]
fn keywords_and_types() {
    let mut lexer = Lexer::new(
        "and or else if for fun nil return while import true false def",
    );
    assert_eq!(lexer.next(), Some(TokenKind::And));
    assert_eq!(lexer.next(), Some(TokenKind::Or));
    assert_eq!(lexer.next(), Some(TokenKind::Else));
    assert_eq!(lexer.next(), Some(TokenKind::If));
    assert_eq!(lexer.next(), Some(TokenKind::For));
    assert_eq!(lexer.next(), Some(TokenKind::Fun));
    assert_eq!(lexer.next(), Some(TokenKind::Nil));
    assert_eq!(lexer.next(), Some(TokenKind::Return));
    assert_eq!(lexer.next(), Some(TokenKind::While));
    assert_eq!(lexer.next(), Some(TokenKind::Import));
    assert_eq!(lexer.next(), Some(TokenKind::BoolValue(true)));
    assert_eq!(lexer.next(), Some(TokenKind::BoolValue(false)));
    assert_eq!(lexer.next(), Some(TokenKind::Def));
    assert_eq!(lexer.next(), None);
}

#[test]
#[should_panic]
fn parse_float_error() {
    let mut lexer = Lexer::new("1.2.3");
    lexer.next();
}
