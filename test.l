Jump(240)
PushInt(0)
Return
PushNil
Return
PushInt(1)
Return
PushNil
Return
PushInt(2)
Return
PushNil
Return
PushInt(3)
Return
PushNil
Return
PushInt(4)
Return
PushNil
Return
PushInt(5)
Return
PushNil
Return
PushInt(6)
Return
PushNil
Return
PushInt(7)
Return
PushNil
Return
PushInt(8)
Return
PushNil
Return
PushInt(9)
Return
PushNil
Return
PushInt(10)
Return
PushNil
Return
PushInt(11)
Return
PushNil
Return
PushInt(12)
Return
PushNil
Return
PushInt(13)
Return
PushNil
Return
PushInt(14)
Return
PushNil
Return
PushInt(15)
Return
PushNil
Return
PushInt(16)
Return
PushNil
Return
PushInt(17)
Return
PushNil
Return
PushInt(18)
Return
PushNil
Return
PushInt(19)
Return
PushNil
Return
PushInt(20)
Return
PushNil
Return
PushInt(21)
Return
PushNil
Return
PushInt(22)
Return
PushNil
Return
PushInt(23)
Return
PushNil
Return
PushInt(24)
Return
PushNil
Return
PushInt(25)
Return
PushNil
Return
PushInt(26)
Return
PushNil
Return
PushInt(27)
Return
PushNil
Return
PushInt(28)
Return
PushNil
Return
PushInt(29)
Return
PushNil
Return
PushInt(30)
Return
PushNil
Return
PushInt(31)
Return
PushNil
Return
PushInt(32)
Return
PushNil
Return
PushInt(33)
Return
PushNil
Return
PushInt(34)
Return
PushNil
Return
PushInt(35)
Return
PushNil
Return
PushInt(36)
Return
PushNil
Return
PushInt(37)
Return
PushNil
Return
PushInt(38)
Return
PushNil
Return
PushInt(40)
Return
PushNil
Return
PushInt(41)
Return
PushNil
Return
PushInt(42)
Return
PushNil
Return
PushInt(43)
Return
PushNil
Return
PushInt(44)
Return
PushNil
Return
PushString(0)
PushString(1)
PushString(2)
PushString(3)
PushString(4)
PushString(5)
PushString(6)
PushString(7)
PushString(8)
PushString(9)
PushString(10)
PushString(11)
PushString(12)
PushString(13)
PushString(14)
PushString(15)
PushString(16)
PushString(17)
PushString(18)
PushString(19)
PushString(20)
PushString(21)
PushString(22)
PushString(23)
PushString(24)
PushString(25)
PushString(26)
PushString(27)
PushString(28)
PushString(29)
PushString(30)
PushString(31)
PushString(32)
PushString(33)
PushString(34)
PushString(35)
PushString(36)
List(37)
PushInt(0)
GetLocal(3)
GetLocal(2)
Native(3)
Less
JumpIfFalse(234)
GetLocal(1)
GetLocal(2)
GetLocal(3)
IndexGet
Equals
JumpIfFalse(229)
GetLocal(3)
Return
GetLocal(3)
PushInt(1)
Plus
SetLocal(3)
Jump(216)
PushNil
Return
Pop
Pop
PushNil
Return
Jump(241)
Jump(724)
GetField("p")
GetField("code")
Native(3)
Less
GetField("code")
GetField("p")
IndexGet
PushString(37)
Equals
And
JumpIfFalse(258)
GetField("p")
PushInt(1)
Plus
SetField("p")
Jump(242)
PushNil
Return
GetField("p")
GetField("code")
Native(3)
GreaterEqual
Return
PushNil
Return
PushSelf
Call("is_done", 1)
JumpIfFalse(272)
PushBool(false)
Return
PushString(38)
PushInt(0)
GetLocal(2)
GetLocal(1)
Native(3)
Less
JumpIfFalse(294)
GetLocal(1)
GetLocal(2)
IndexGet
GetField("code")
GetField("p")
IndexGet
Equals
JumpIfFalse(289)
PushBool(true)
Return
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(274)
PushBool(false)
Return
Pop
Pop
PushNil
Return
PushSelf
Call("is_done", 1)
JumpIfFalse(305)
PushBool(false)
Return
PushString(39)
PushInt(0)
GetLocal(2)
GetLocal(1)
Native(3)
Less
JumpIfFalse(327)
GetLocal(1)
GetLocal(2)
IndexGet
GetField("code")
GetField("p")
IndexGet
Equals
JumpIfFalse(322)
PushBool(true)
Return
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(307)
PushBool(false)
Return
Pop
Pop
PushNil
Return
GetField("p")
GetField("code")
Native(3)
Less
JumpIfFalse(342)
GetField("p")
PushInt(1)
Plus
SetField("p")
PushNil
Return
GetField("p")
PushString(40)
PushSelf
Call("letter", 1)
PushSelf
Call("digit", 1)
Or
JumpIfFalse(363)
GetLocal(2)
GetField("code")
GetField("p")
IndexGet
Plus
SetLocal(2)
GetField("p")
PushInt(1)
Plus
SetField("p")
Jump(346)
GetField("p")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
GetLocal(2)
Call("from_str", 2)
GetLocal(4)
PushNil
NotEquals
JumpIfFalse(377)
GetLocal(2)
GetLocal(1)
GetLocal(3)
GetLocal(4)
Instance(["kind", "end", "start", "value"], [], [])
Return
GetLocal(2)
GetLocal(1)
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Identifier", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
Pop
Pop
Pop
Pop
PushNil
Return
GetField("p")
PushString(41)
PushBool(false)
PushSelf
Call("digit", 1)
GetField("code")
GetField("p")
IndexGet
PushString(42)
Equals
Or
JumpIfFalse(421)
GetField("code")
GetField("p")
IndexGet
PushString(43)
Equals
JumpIfFalse(410)
PushBool(true)
SetLocal(3)
GetLocal(2)
GetField("code")
GetField("p")
IndexGet
Plus
SetLocal(2)
GetField("p")
PushInt(1)
Plus
SetField("p")
Jump(393)
GetField("p")
GetLocal(3)
JumpIfFalse(431)
GetLocal(2)
GetLocal(1)
GetLocal(4)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Float", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
GetLocal(2)
GetLocal(1)
GetLocal(4)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Int", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
Pop
Pop
Pop
Pop
PushNil
Return
GetField("p")
PushString(44)
GetField("p")
PushInt(1)
Plus
SetField("p")
GetField("p")
GetField("code")
Native(3)
Less
GetField("code")
GetField("p")
IndexGet
PushString(45)
NotEquals
And
JumpIfFalse(508)
GetField("code")
GetField("p")
IndexGet
PushString(46)
Equals
GetLocal(3)
JumpIfFalse(493)
GetLocal(2)
GetField("code")
GetField("p")
IndexGet
Plus
SetLocal(2)
GetField("p")
PushInt(1)
Plus
SetField("p")
GetField("p")
GetField("code")
Native(3)
Less
JumpIfFalse(493)
GetLocal(2)
GetField("code")
GetField("p")
IndexGet
Plus
SetLocal(2)
GetField("p")
PushInt(1)
Plus
SetField("p")
GetLocal(3)
Not
JumpIfFalse(506)
GetLocal(2)
GetField("code")
GetField("p")
IndexGet
Plus
SetLocal(2)
GetField("p")
PushInt(1)
Plus
SetField("p")
Pop
Jump(450)
GetField("p")
GetField("code")
Native(3)
Less
JumpIfFalse(521)
GetLocal(2)
PushString(47)
Plus
SetLocal(2)
GetField("p")
PushInt(1)
Plus
SetField("p")
GetField("p")
GetLocal(2)
GetLocal(1)
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("String", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
Pop
Pop
Pop
PushNil
Return
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
GetField("code")
GetField("p")
IndexGet
Call("from_str", 2)
GetLocal(1)
PushNil
NotEquals
JumpIfFalse(553)
GetField("code")
GetField("p")
IndexGet
GetField("p")
GetField("p")
PushInt(1)
Plus
GetLocal(1)
Instance(["kind", "end", "start", "value"], [], [])
Return
PushNil
Return
Pop
PushNil
Return
GetField("p")
PushInt(1)
Plus
GetField("code")
Native(3)
Equals
JumpIfFalse(567)
PushNil
Return
GetField("code")
GetField("p")
IndexGet
GetField("code")
GetField("p")
PushInt(1)
Plus
IndexGet
GetLocal(1)
PushString(48)
Equals
GetLocal(2)
PushString(49)
Equals
And
JumpIfFalse(594)
GetLocal(1)
GetLocal(2)
Plus
GetField("p")
GetField("p")
PushInt(2)
Plus
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("BangEqual", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
GetLocal(1)
PushString(50)
Equals
GetLocal(2)
PushString(51)
Equals
And
JumpIfFalse(613)
GetLocal(1)
GetLocal(2)
Plus
GetField("p")
GetField("p")
PushInt(2)
Plus
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("EqualEqual", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
GetLocal(1)
PushString(52)
Equals
GetLocal(2)
PushString(53)
Equals
And
JumpIfFalse(632)
GetLocal(1)
GetLocal(2)
Plus
GetField("p")
GetField("p")
PushInt(2)
Plus
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("GreaterEqual", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
GetLocal(1)
PushString(54)
Equals
GetLocal(2)
PushString(55)
Equals
And
JumpIfFalse(651)
GetLocal(1)
GetLocal(2)
Plus
GetField("p")
GetField("p")
PushInt(2)
Plus
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LessEqual", 1)
Instance(["kind", "end", "start", "value"], [], [])
Return
PushNil
Return
Pop
Pop
PushNil
Return
PushSelf
Call("is_done", 1)
JumpIfFalse(662)
PushNil
Return
PushSelf
Call("whitespace", 1)
Pop
PushSelf
Call("is_done", 1)
Not
JumpIfFalse(720)
PushSelf
Call("two_char", 1)
GetLocal(1)
PushNil
NotEquals
JumpIfFalse(681)
GetField("p")
PushInt(2)
Plus
SetField("p")
GetLocal(1)
Return
PushSelf
Call("letter", 1)
JumpIfFalse(687)
PushSelf
Call("identifier", 1)
Return
PushSelf
Call("digit", 1)
JumpIfFalse(693)
PushSelf
Call("number", 1)
Return
PushSelf
Call("single_char", 1)
GetLocal(2)
PushNil
NotEquals
JumpIfFalse(705)
GetField("p")
PushInt(1)
Plus
SetField("p")
GetLocal(2)
Return
GetField("code")
GetField("p")
IndexGet
PushString(56)
Equals
JumpIfFalse(714)
PushSelf
Call("string", 1)
Return
PushSelf
Call("advance", 1)
Pop
Pop
Pop
Jump(665)
PushNil
Return
PushNil
Return
Jump(751)
GetField("peek_item")
PushNil
NotEquals
JumpIfFalse(735)
GetField("peek_item")
PushNil
SetField("peek_item")
GetLocal(1)
Return
Pop
GetField("item")
Call("next", 1)
Return
PushNil
Return
GetField("peek_item")
PushNil
Equals
JumpIfFalse(747)
GetField("item")
Call("next", 1)
SetField("peek_item")
GetField("peek_item")
Return
PushNil
Return
Jump(758)
GetLocal(1)
PushSelf
Call("visitAstRoot", 2)
Return
PushNil
Return
Jump(765)
GetLocal(1)
PushSelf
Call("visitAstNeg", 2)
Return
PushNil
Return
Jump(772)
GetLocal(1)
PushSelf
Call("visitAstNot", 2)
Return
PushNil
Return
Jump(779)
GetLocal(1)
PushSelf
Call("visitAstFloat", 2)
Return
PushNil
Return
Jump(786)
GetLocal(1)
PushSelf
Call("visitAstInt", 2)
Return
PushNil
Return
Jump(793)
GetLocal(1)
PushSelf
Call("visitAstString", 2)
Return
PushNil
Return
Jump(804)
GetLocal(1)
PushSelf
Call("visitAstGetField", 2)
Return
PushNil
Return
PushString(57)
Return
PushNil
Return
Jump(811)
GetLocal(1)
PushSelf
Call("visitAstSetField", 2)
Return
PushNil
Return
Jump(818)
GetLocal(1)
PushSelf
Call("visitAstList", 2)
Return
PushNil
Return
Jump(829)
GetLocal(1)
PushSelf
Call("visitAstIndex", 2)
Return
PushNil
Return
PushString(58)
Return
PushNil
Return
Jump(840)
GetLocal(1)
PushSelf
Call("visitAstIndexSet", 2)
Return
PushNil
Return
PushString(59)
Return
PushNil
Return
Jump(847)
GetLocal(1)
PushSelf
Call("visitAstBool", 2)
Return
PushNil
Return
Jump(854)
GetLocal(1)
PushSelf
Call("visitAstNil", 2)
Return
PushNil
Return
Jump(865)
GetLocal(1)
PushSelf
Call("visitAstGetVar", 2)
Return
PushNil
Return
PushString(60)
Return
PushNil
Return
Jump(872)
GetLocal(1)
PushSelf
Call("visitAstDef", 2)
Return
PushNil
Return
Jump(879)
GetLocal(1)
PushSelf
Call("visitAstPlus", 2)
Return
PushNil
Return
Jump(886)
GetLocal(1)
PushSelf
Call("visitAstMinus", 2)
Return
PushNil
Return
Jump(893)
GetLocal(1)
PushSelf
Call("visitAstClass", 2)
Return
PushNil
Return
Jump(900)
GetLocal(1)
PushSelf
Call("visitAstBlock", 2)
Return
PushNil
Return
Jump(911)
GetLocal(1)
PushSelf
Call("visitAstReassign", 2)
Return
PushNil
Return
PushString(61)
Return
PushNil
Return
Jump(918)
GetLocal(1)
PushSelf
Call("visitAstInstance", 2)
Return
PushNil
Return
Jump(925)
GetLocal(1)
PushSelf
Call("visitAstNative", 2)
Return
PushNil
Return
Jump(936)
GetLocal(1)
PushSelf
Call("visitAstMethod", 2)
Return
PushNil
Return
PushString(62)
Return
PushNil
Return
Jump(943)
GetLocal(1)
PushSelf
Call("visitAstPop", 2)
Return
PushNil
Return
Jump(950)
GetLocal(1)
PushSelf
Call("visitAstEqualEqual", 2)
Return
PushNil
Return
Jump(957)
GetLocal(1)
PushSelf
Call("visitAstIf", 2)
Return
PushNil
Return
Jump(964)
GetLocal(1)
PushSelf
Call("visitAstReturn", 2)
Return
PushNil
Return
Jump(971)
GetLocal(1)
PushSelf
Call("visitAstWhile", 2)
Return
PushNil
Return
Jump(978)
GetLocal(1)
PushSelf
Call("visitAstOr", 2)
Return
PushNil
Return
Jump(985)
GetLocal(1)
PushSelf
Call("visitAstAnd", 2)
Return
PushNil
Return
Jump(992)
GetLocal(1)
PushSelf
Call("visitAstBangEqual", 2)
Return
PushNil
Return
Jump(999)
GetLocal(1)
PushSelf
Call("visitAstGreater", 2)
Return
PushNil
Return
Jump(1006)
GetLocal(1)
PushSelf
Call("visitAstGreaterEqual", 2)
Return
PushNil
Return
Jump(1013)
GetLocal(1)
PushSelf
Call("visitAstLess", 2)
Return
PushNil
Return
Jump(1020)
GetLocal(1)
PushSelf
Call("visitAstLessEqual", 2)
Return
PushNil
Return
Jump(1031)
GetLocal(1)
PushSelf
Call("visitAstGet", 2)
Return
PushNil
Return
PushString(63)
Return
PushNil
Return
Jump(1038)
GetLocal(1)
PushSelf
Call("visitAstImport", 2)
Return
PushNil
Return
Jump(1049)
GetLocal(1)
PushSelf
Call("visitAstSet", 2)
Return
PushNil
Return
PushString(64)
Return
PushNil
Return
Jump(1056)
GetLocal(1)
PushSelf
Call("visitAstGetSelf", 2)
Return
PushNil
Return
Jump(1057)
Jump(2388)
GetField("lexer")
Call("next", 1)
GetLocal(1)
GetLocal(2)
Get("kind")
NotEquals
JumpIfFalse(1081)
PushString(65)
GetLocal(2)
Print(2)
Pop
PushString(66)
GetLocal(1)
Native(1)
Plus
PushString(67)
Plus
GetLocal(2)
Get("kind")
Native(1)
Plus
Native(4)
Pop
Pop
PushNil
Return
GetField("lexer")
Call("next", 1)
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Identifier", 1)
NotEquals
JumpIfFalse(1099)
PushString(68)
GetLocal(1)
Get("kind")
Native(1)
Plus
Native(4)
Pop
GetLocal(1)
Get("value")
Return
Pop
PushNil
Return
GetLocal(1)
PushNil
Equals
JumpIfFalse(1111)
PushInt(0)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Equal", 1)
Equals
JumpIfFalse(1119)
PushInt(1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Or", 1)
Equals
JumpIfFalse(1127)
PushInt(3)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("And", 1)
Equals
JumpIfFalse(1135)
PushInt(4)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("BangEqual", 1)
Equals
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("EqualEqual", 1)
Equals
Or
JumpIfFalse(1149)
PushInt(5)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Greater", 1)
Equals
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("GreaterEqual", 1)
Equals
Or
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Less", 1)
Equals
Or
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LessEqual", 1)
Equals
Or
JumpIfFalse(1175)
PushInt(6)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Plus", 1)
Equals
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Minus", 1)
Equals
Or
JumpIfFalse(1189)
PushInt(7)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Star", 1)
Equals
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Slash", 1)
Equals
Or
JumpIfFalse(1203)
PushInt(8)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
Equals
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBracket", 1)
Equals
Or
JumpIfFalse(1217)
PushInt(10)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Dot", 1)
Equals
JumpIfFalse(1225)
PushInt(11)
Return
PushInt(0)
Return
PushNil
Return
GetField("lexer")
Call("peek", 1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Identifier", 1)
Equals
JumpIfFalse(1242)
PushSelf
Call("consume_identifier", 1)
GetLocal(1)
Instance(["value"], ["accept", "kind"], [794, 800])
Return
Pop
Instance([], ["accept"], [1050])
Return
PushString(69)
Native(4)
Pop
PushNil
Return
PushSelf
Call("expr", 1)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
Call("consume", 2)
Pop
GetLocal(1)
Return
Pop
PushNil
Return
GetField("lexer")
Call("next", 1)
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Minus", 1)
Equals
JumpIfFalse(1274)
PushSelf
PushInt(9)
Call("parse_expr", 2)
Instance(["expr"], ["accept"], [759])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Bang", 1)
Equals
JumpIfFalse(1285)
PushSelf
PushInt(9)
Call("parse_expr", 2)
Instance(["expr"], ["accept"], [766])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBracket", 1)
Equals
JumpIfFalse(1294)
PushSelf
Call("list", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Identifier", 1)
Equals
JumpIfFalse(1304)
GetLocal(1)
Get("value")
Instance(["value"], ["accept", "kind"], [855, 861])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Int", 1)
Equals
JumpIfFalse(1314)
GetLocal(1)
Get("value")
Instance(["value"], ["accept"], [780])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Float", 1)
Equals
JumpIfFalse(1324)
GetLocal(1)
Get("value")
Instance(["value"], ["accept"], [773])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("String", 1)
Equals
JumpIfFalse(1334)
GetLocal(1)
Get("value")
Instance(["value"], ["accept"], [787])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("True", 1)
Equals
JumpIfFalse(1343)
PushBool(true)
Instance(["value"], ["accept"], [841])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("False", 1)
Equals
JumpIfFalse(1352)
PushBool(false)
Instance(["value"], ["accept"], [841])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Nil", 1)
Equals
JumpIfFalse(1360)
Instance([], ["accept"], [848])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("At", 1)
Equals
JumpIfFalse(1369)
PushSelf
Call("field", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Hash", 1)
Equals
JumpIfFalse(1378)
PushSelf
Call("native", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
Equals
JumpIfFalse(1387)
PushSelf
Call("grouping", 1)
Return
PushString(70)
GetLocal(1)
Print(2)
Pop
PushString(71)
Native(4)
Pop
Pop
PushNil
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Or", 1)
Equals
JumpIfFalse(1406)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [972])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("And", 1)
Equals
JumpIfFalse(1415)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [979])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("BangEqual", 1)
Equals
JumpIfFalse(1424)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [986])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("EqualEqual", 1)
Equals
JumpIfFalse(1433)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [944])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Greater", 1)
Equals
JumpIfFalse(1442)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [993])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("GreaterEqual", 1)
Equals
JumpIfFalse(1451)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [1000])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Less", 1)
Equals
JumpIfFalse(1460)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [1007])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LessEqual", 1)
Equals
JumpIfFalse(1469)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [1014])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Plus", 1)
Equals
JumpIfFalse(1478)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [873])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Minus", 1)
Equals
JumpIfFalse(1487)
GetLocal(1)
GetLocal(2)
Instance(["rhs", "lhs"], ["accept"], [880])
Return
GetLocal(3)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Equal", 1)
Equals
JumpIfFalse(1526)
GetLocal(1)
Call("kind", 1)
PushString(72)
Equals
JumpIfFalse(1502)
GetLocal(1)
Get("value")
GetLocal(2)
Instance(["expr", "name"], ["accept", "kind"], [901, 907])
Return
GetLocal(1)
Call("kind", 1)
PushString(73)
Equals
JumpIfFalse(1514)
GetLocal(1)
Get("lhs")
GetLocal(1)
Get("field")
GetLocal(2)
Instance(["rhs", "field", "lhs"], ["accept", "kind"], [1039, 1045])
Return
GetLocal(1)
Call("kind", 1)
PushString(74)
Equals
JumpIfFalse(1526)
GetLocal(1)
Get("lhs")
GetLocal(1)
Get("indexer")
GetLocal(2)
Instance(["rhs", "indexer", "lhs"], ["accept", "kind"], [830, 836])
Return
PushString(75)
Native(4)
Pop
PushNil
Return
List(0)
GetField("lexer")
Call("peek", 1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
NotEquals
JumpIfFalse(1557)
GetLocal(2)
PushSelf
Call("expr", 1)
Native(5)
Pop
GetField("lexer")
Call("peek", 1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Comma", 1)
Equals
JumpIfFalse(1556)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Comma", 1)
Call("consume", 2)
Pop
Jump(1532)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
Call("consume", 2)
Pop
GetLocal(1)
Call("kind", 1)
PushString(76)
Equals
JumpIfFalse(1572)
GetLocal(1)
Get("value")
GetLocal(2)
Instance(["args", "name"], ["accept"], [912])
Return
GetLocal(1)
Call("kind", 1)
PushString(77)
Equals
JumpIfFalse(1584)
GetLocal(1)
Get("field")
GetLocal(2)
GetLocal(1)
Get("lhs")
Instance(["lhs", "args", "name"], ["accept", "kind"], [926, 932])
Return
GetLocal(1)
Call("kind", 1)
PushString(78)
Equals
JumpIfFalse(1595)
GetLocal(1)
Get("value")
GetLocal(2)
PushNil
Instance(["lhs", "args", "name"], ["accept", "kind"], [926, 932])
Return
PushString(79)
Native(4)
Pop
Pop
PushNil
Return
PushSelf
Call("expr", 1)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBracket", 1)
Call("consume", 2)
Pop
GetLocal(1)
GetLocal(2)
Instance(["indexer", "lhs"], ["accept", "kind"], [819, 825])
Return
Pop
PushNil
Return
PushSelf
Call("consume_identifier", 1)
GetLocal(1)
GetLocal(2)
Instance(["field", "lhs"], ["accept", "kind"], [1021, 1027])
Return
Pop
PushNil
Return
GetField("lexer")
Call("peek", 1)
GetLocal(2)
PushNil
NotEquals
JumpIfFalse(1723)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
Equals
JumpIfFalse(1645)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
Call("consume", 2)
Pop
PushSelf
GetLocal(1)
Call("call", 2)
SetLocal(1)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBracket", 1)
Equals
JumpIfFalse(1660)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBracket", 1)
Call("consume", 2)
Pop
PushSelf
GetLocal(1)
Call("index", 2)
SetLocal(1)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Dot", 1)
Equals
JumpIfFalse(1675)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Dot", 1)
Call("consume", 2)
Pop
PushSelf
GetLocal(1)
Call("get_or_set", 2)
SetLocal(1)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
NotEquals
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBracket", 1)
NotEquals
And
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Dot", 1)
NotEquals
And
JumpIfFalse(1719)
PushSelf
GetLocal(2)
Call("infix_prec", 2)
GetLocal(3)
PushInt(0)
Equals
JumpIfFalse(1702)
GetLocal(1)
Return
PushSelf
GetLocal(2)
Get("kind")
Call("consume", 2)
Pop
PushSelf
GetLocal(3)
Call("parse_expr", 2)
PushSelf
GetLocal(1)
GetLocal(4)
GetLocal(2)
Get("kind")
Call("match_infix_token", 4)
SetLocal(1)
Pop
Pop
GetField("lexer")
Call("peek", 1)
SetLocal(2)
Jump(1626)
GetLocal(1)
Return
Pop
PushNil
Return
PushSelf
Call("parse_prefix", 1)
GetLocal(1)
PushSelf
GetField("lexer")
Call("peek", 1)
Call("infix_prec", 2)
Less
JumpIfFalse(1742)
PushSelf
GetLocal(2)
Call("parse_infix", 2)
SetLocal(2)
Jump(1730)
GetLocal(2)
Return
Pop
PushNil
Return
PushSelf
PushInt(0)
Call("parse_expr", 2)
Return
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBrace", 1)
Call("consume", 2)
Pop
List(0)
PushBool(false)
GetLocal(2)
Not
JumpIfFalse(1786)
GetField("lexer")
Call("peek", 1)
GetLocal(3)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBrace", 1)
Equals
JumpIfFalse(1773)
PushBool(true)
SetLocal(2)
GetLocal(3)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBrace", 1)
NotEquals
JumpIfFalse(1784)
GetLocal(1)
PushSelf
Call("stmt", 1)
Native(5)
Pop
Pop
Jump(1760)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBrace", 1)
Call("consume", 2)
Pop
GetLocal(1)
Instance(["stmts"], ["accept"], [894])
Return
Pop
Pop
PushNil
Return
GetField("lexer")
Call("peek", 1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
NotEquals
JumpIfFalse(1807)
List(0)
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
Call("consume", 2)
Pop
List(0)
GetField("lexer")
Call("peek", 1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
NotEquals
JumpIfFalse(1848)
GetField("lexer")
Call("peek", 1)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Identifier", 1)
Equals
JumpIfFalse(1835)
PushSelf
Call("consume_identifier", 1)
GetLocal(1)
GetLocal(3)
Native(5)
Pop
Pop
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Comma", 1)
Equals
JumpIfFalse(1846)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Comma", 1)
Call("consume", 2)
Pop
Pop
Jump(1813)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
Call("consume", 2)
Pop
GetLocal(1)
Return
Pop
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Def", 1)
Call("consume", 2)
Pop
PushSelf
Call("consume_identifier", 1)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Equal", 1)
Call("consume", 2)
Pop
PushSelf
Call("expr", 1)
GetLocal(1)
GetLocal(2)
Instance(["expr", "name"], ["accept"], [866])
Return
Pop
Pop
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Class", 1)
Call("consume", 2)
Pop
PushSelf
Call("consume_identifier", 1)
PushSelf
Call("param_list", 1)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBrace", 1)
Call("consume", 2)
Pop
List(0)
GetField("lexer")
Call("peek", 1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBrace", 1)
NotEquals
JumpIfFalse(1919)
PushSelf
Call("consume_identifier", 1)
PushSelf
Call("param_list", 1)
PushSelf
Call("block", 1)
GetLocal(3)
GetLocal(4)
GetLocal(5)
GetLocal(6)
Instance(["block", "params", "name"], [], [])
Native(5)
Pop
Pop
Pop
Pop
Jump(1895)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBrace", 1)
Call("consume", 2)
Pop
GetLocal(1)
GetLocal(2)
GetLocal(3)
Instance(["methods", "fields", "name"], ["accept"], [887])
Return
Pop
Pop
Pop
PushNil
Return
List(0)
GetField("lexer")
Call("peek", 1)
PushBool(true)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBracket", 1)
NotEquals
JumpIfFalse(1963)
GetLocal(3)
Not
JumpIfFalse(1952)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Comma", 1)
Call("consume", 2)
Pop
PushBool(false)
SetLocal(3)
GetLocal(1)
PushSelf
Call("expr", 1)
Native(5)
Pop
GetField("lexer")
Call("peek", 1)
SetLocal(2)
Jump(1938)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBracket", 1)
Call("consume", 2)
Pop
GetLocal(1)
Instance(["items"], ["accept"], [812])
Return
Pop
Pop
Pop
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("If", 1)
Call("consume", 2)
Pop
PushSelf
Call("expr", 1)
PushSelf
Call("block", 1)
GetLocal(1)
GetLocal(2)
Instance(["block", "condition"], ["accept"], [951])
Return
Pop
Pop
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("While", 1)
Call("consume", 2)
Pop
PushSelf
Call("expr", 1)
PushSelf
Call("block", 1)
GetLocal(1)
GetLocal(2)
Instance(["block", "condition"], ["accept"], [965])
Return
Pop
Pop
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Return", 1)
Call("consume", 2)
Pop
PushSelf
Call("expr", 1)
Instance(["expr"], ["accept"], [958])
Return
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("At", 1)
Call("consume", 2)
Pop
PushSelf
Call("consume_identifier", 1)
GetField("lexer")
Call("next", 1)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Equal", 1)
Equals
JumpIfFalse(2041)
GetLocal(1)
PushSelf
Call("expr", 1)
Instance(["expr", "name"], ["accept"], [805])
Return
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
Equals
JumpIfFalse(2053)
PushSelf
GetLocal(1)
Instance(["value"], ["accept", "kind"], [794, 800])
Call("call", 2)
Instance(["expr"], ["accept"], [937])
Return
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBracket", 1)
Equals
JumpIfFalse(2081)
PushSelf
Call("expr", 1)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBracket", 1)
Call("consume", 2)
Pop
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Equal", 1)
Call("consume", 2)
Pop
PushSelf
Call("expr", 1)
GetLocal(1)
Instance(["value"], ["accept", "kind"], [794, 800])
GetLocal(3)
GetLocal(4)
Instance(["rhs", "indexer", "lhs"], ["accept", "kind"], [830, 836])
Return
Pop
Pop
PushString(80)
GetLocal(2)
Print(2)
Pop
PushString(81)
Native(4)
Pop
Pop
Pop
PushNil
Return
PushSelf
Call("consume_identifier", 1)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftParen", 1)
Call("consume", 2)
Pop
List(0)
GetField("lexer")
Call("peek", 1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
Equals
GetLocal(3)
Not
JumpIfFalse(2136)
GetLocal(2)
PushSelf
Call("expr", 1)
Native(5)
Pop
GetField("lexer")
Call("peek", 1)
Get("kind")
GetLocal(4)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Comma", 1)
Equals
JumpIfFalse(2127)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Comma", 1)
Call("consume", 2)
Pop
GetLocal(4)
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
Equals
JumpIfFalse(2134)
PushBool(true)
SetLocal(3)
Pop
Jump(2106)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightParen", 1)
Call("consume", 2)
Pop
GetLocal(1)
GetLocal(2)
Instance(["args", "name"], ["accept"], [919])
Return
Pop
Pop
Pop
PushNil
Return
GetField("lexer")
Call("peek", 1)
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBrace", 1)
Equals
JumpIfFalse(2161)
PushSelf
Call("block", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Def", 1)
Equals
JumpIfFalse(2170)
PushSelf
Call("stmt_def", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBracket", 1)
Equals
JumpIfFalse(2179)
PushSelf
Call("list", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Class", 1)
Equals
JumpIfFalse(2188)
PushSelf
Call("stmt_class", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Identifier", 1)
Equals
JumpIfFalse(2221)
PushSelf
Call("expr", 1)
PushString(82)
GetLocal(2)
Print(2)
Pop
GetLocal(2)
Call("kind", 1)
GetLocal(3)
PushString(83)
Equals
GetLocal(3)
PushString(84)
Equals
GetLocal(3)
PushString(85)
Equals
Or
Or
JumpIfFalse(2217)
GetLocal(2)
Instance(["expr"], ["accept"], [937])
Return
GetLocal(2)
Return
Pop
Pop
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("If", 1)
Equals
JumpIfFalse(2230)
PushSelf
Call("stmt_if", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("While", 1)
Equals
JumpIfFalse(2239)
PushSelf
Call("stmt_while", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Return", 1)
Equals
JumpIfFalse(2248)
PushSelf
Call("stmt_return", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("At", 1)
Equals
JumpIfFalse(2257)
PushSelf
Call("stmt_set_field", 1)
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Hash", 1)
Equals
JumpIfFalse(2272)
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Hash", 1)
Call("consume", 2)
Pop
PushSelf
Call("native", 1)
Instance(["expr"], ["accept"], [937])
Return
GetLocal(1)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Import", 1)
Equals
JumpIfFalse(2281)
PushSelf
Call("stmt_import", 1)
Return
PushString(86)
GetLocal(1)
Print(2)
Pop
PushString(87)
Native(4)
Pop
Pop
PushNil
Return
List(0)
GetField("lexer")
Call("peek", 1)
PushNil
NotEquals
JumpIfFalse(2305)
PushSelf
Call("stmt", 1)
GetLocal(1)
GetLocal(2)
Native(5)
Pop
Pop
Jump(2292)
GetLocal(1)
Instance(["nodes"], ["accept"], [752])
Return
Pop
PushNil
Return
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("Import", 1)
Call("consume", 2)
Pop
PushSelf
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("LeftBrace", 1)
Call("consume", 2)
Pop
List(0)
GetField("lexer")
Call("next", 1)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("RightBrace", 1)
NotEquals
JumpIfFalse(2381)
GetLocal(2)
Get("kind")
Instance([], ["LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", "Less", "Greater", "Equal", "Plus", "Minus", "Slash", "Star", "Dot", "Comma", "Colon", "SemiColon", "Bang", "At", "Hash", "Class", "And", "Or", "Else", "If", "For", "Nil", "Return", "While", "Import", "True", "False", "Def", "Int", "Float", "Bool", "Str", "Identifier", "String", "Float", "BangEqual", "EqualEqual", "GreaterEqual", "LessEqual", "from_str"], [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177])
Call("String", 1)
Equals
JumpIfFalse(2377)
PushString(88)
GetField("file")
PushString(89)
Native(9)
PushInt(0)
GetLocal(5)
GetLocal(4)
Native(3)
PushInt(1)
Minus
Less
JumpIfFalse(2361)
GetLocal(3)
GetLocal(4)
GetLocal(5)
IndexGet
PushString(90)
Plus
Plus
SetLocal(3)
GetLocal(5)
PushInt(1)
Plus
SetLocal(5)
Jump(2341)
GetLocal(3)
GetLocal(2)
Get("value")
PushString(91)
Native(9)
PushInt(0)
IndexGet
Plus
SetLocal(3)
GetLocal(1)
GetLocal(3)
Native(5)
Pop
Pop
Pop
Pop
GetField("lexer")
Call("next", 1)
SetLocal(2)
Jump(2324)
GetLocal(1)
Instance(["imports"], ["accept"], [1032])
Return
Pop
Pop
PushNil
Return
Jump(3376)
PushInt(0)
PushString(92)
GetLocal(2)
GetField("indent")
Native(3)
Less
JumpIfFalse(2407)
GetLocal(3)
GetField("indent")
GetLocal(2)
IndexGet
Plus
SetLocal(3)
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(2391)
GetField("is_last")
JumpIfFalse(2415)
GetLocal(3)
PushString(93)
Plus
GetLocal(1)
Print(2)
Pop
GetField("is_last")
Not
JumpIfFalse(2424)
GetLocal(3)
PushString(94)
Plus
GetLocal(1)
Print(2)
Pop
Pop
Pop
PushNil
Return
GetField("is_last")
JumpIfFalse(2434)
GetField("indent")
PushString(95)
Native(5)
Pop
GetField("is_last")
Not
JumpIfFalse(2441)
GetField("indent")
PushString(96)
Native(5)
Pop
PushNil
Return
GetField("indent")
Native(6)
Pop
PushNil
Return
PushSelf
Call("add_indent", 1)
Pop
PushInt(0)
GetLocal(2)
GetLocal(1)
Native(3)
Less
JumpIfFalse(2479)
PushBool(false)
SetField("is_last")
GetLocal(2)
GetLocal(1)
Native(3)
PushInt(1)
Minus
Equals
JumpIfFalse(2468)
PushBool(true)
SetField("is_last")
GetLocal(1)
GetLocal(2)
IndexGet
PushSelf
Call("accept", 2)
Pop
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(2452)
PushSelf
Call("pop_indent", 1)
Pop
Pop
PushNil
Return
PushSelf
PushString(97)
Call("print_node", 2)
Pop
PushSelf
GetLocal(1)
Get("nodes")
Call("loop", 2)
Pop
PushNil
Return
PushSelf
PushString(98)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(99)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(100)
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(101)
GetLocal(1)
Get("value")
PushString(102)
Plus
Plus
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(103)
GetLocal(1)
Get("value")
PushString(104)
Plus
Plus
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(105)
GetLocal(1)
Get("value")
PushString(106)
Plus
Plus
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(107)
GetLocal(1)
Get("value")
PushString(108)
Plus
Plus
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(109)
GetLocal(1)
Get("name")
PushString(110)
Plus
Plus
Call("print_node", 2)
Pop
PushBool(true)
SetField("is_last")
PushSelf
Call("add_indent", 1)
Pop
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(111)
Call("print_node", 2)
Pop
PushSelf
GetLocal(1)
Get("items")
Call("loop", 2)
Pop
PushNil
Return
PushSelf
PushString(112)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("indexer")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(113)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("indexer")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(114)
GetLocal(1)
Get("value")
Native(1)
Plus
PushString(115)
Plus
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(116)
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(117)
GetLocal(1)
Get("value")
PushString(118)
Plus
Plus
Call("print_node", 2)
Pop
PushNil
Return
PushSelf
PushString(119)
GetLocal(1)
Get("name")
Plus
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(120)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(121)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(122)
GetLocal(1)
Get("name")
Plus
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushInt(0)
GetLocal(2)
GetLocal(1)
Get("fields")
Native(3)
Less
JumpIfFalse(2824)
GetLocal(1)
Get("methods")
Native(3)
PushInt(0)
Equals
GetLocal(2)
GetLocal(1)
Get("fields")
Native(3)
PushInt(1)
Minus
Equals
And
SetField("is_last")
PushSelf
PushString(123)
GetLocal(1)
Get("fields")
GetLocal(2)
IndexGet
Plus
Call("print_node", 2)
Pop
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(2790)
PushInt(0)
SetLocal(2)
GetLocal(2)
GetLocal(1)
Get("methods")
Native(3)
Less
JumpIfFalse(2871)
GetLocal(2)
GetLocal(1)
Get("methods")
Native(3)
PushInt(1)
Minus
Equals
JumpIfFalse(2842)
PushBool(true)
SetField("is_last")
PushSelf
PushString(124)
GetLocal(1)
Get("methods")
GetLocal(2)
IndexGet
Get("name")
Plus
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
GetLocal(1)
Get("methods")
GetLocal(2)
IndexGet
Get("block")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(2826)
PushSelf
Call("pop_indent", 1)
Pop
Pop
PushNil
Return
PushSelf
PushString(125)
Call("print_node", 2)
Pop
PushSelf
GetLocal(1)
Get("stmts")
Call("loop", 2)
Pop
PushNil
Return
PushSelf
PushString(126)
GetLocal(1)
Get("name")
Plus
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(127)
GetLocal(1)
Get("name")
Plus
Call("print_node", 2)
Pop
PushSelf
GetLocal(1)
Get("args")
Call("loop", 2)
Pop
PushNil
Return
PushSelf
PushString(128)
GetLocal(1)
Get("name")
Plus
Call("print_node", 2)
Pop
PushSelf
GetLocal(1)
Get("args")
Call("loop", 2)
Pop
PushNil
Return
PushSelf
PushString(129)
GetLocal(1)
Get("name")
Plus
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
GetLocal(1)
Get("lhs")
PushNil
Equals
GetLocal(1)
Get("args")
Native(3)
PushInt(0)
Equals
And
SetField("is_last")
PushInt(0)
GetLocal(1)
Get("args")
Native(3)
PushInt(0)
Greater
JumpIfFalse(3009)
PushSelf
PushString(130)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
GetLocal(1)
Get("lhs")
PushNil
Equals
SetField("is_last")
GetLocal(2)
GetLocal(1)
Get("args")
Native(3)
Less
JumpIfFalse(3006)
GetLocal(2)
GetLocal(1)
Get("args")
Native(3)
PushInt(1)
Minus
Equals
JumpIfFalse(2994)
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("args")
GetLocal(2)
IndexGet
PushSelf
Call("accept", 2)
Pop
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(2978)
PushSelf
Call("pop_indent", 1)
Pop
GetLocal(1)
Get("lhs")
PushNil
NotEquals
JumpIfFalse(3021)
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
Pop
PushNil
Return
PushSelf
PushString(131)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(132)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(133)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("condition")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("block")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(134)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(135)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
GetLocal(1)
Get("condition")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("block")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(136)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(137)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(138)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(139)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(140)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(141)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(142)
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(143)
GetLocal(1)
Get("field")
PushString(144)
Plus
Plus
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
PushSelf
PushString(145)
GetLocal(1)
Get("field")
PushString(146)
Plus
Plus
Call("print_node", 2)
Pop
PushSelf
Call("add_indent", 1)
Pop
PushBool(false)
SetField("is_last")
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushBool(true)
SetField("is_last")
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
Call("pop_indent", 1)
Pop
PushNil
Return
Jump(3377)
Jump(3378)
Jump(3379)
Jump(4670)
PushString(147)
Print(1)
Pop
List(0)
SetField("code")
List(0)
SetField("strings")
List(0)
List(1)
SetField("variables")
PushInt(0)
SetField("depth")
List(0)
SetField("classes")
PushNil
SetField("current_fields")
PushNil
SetField("current_class_name")
PushNil
Return
PushInt(0)
GetLocal(2)
GetField("classes")
Native(3)
Less
JumpIfFalse(3422)
GetLocal(1)
GetField("classes")
GetLocal(2)
IndexGet
Get("name")
Equals
JumpIfFalse(3417)
GetField("classes")
GetLocal(2)
IndexGet
Return
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(3401)
PushNil
Return
Pop
PushNil
Return
GetField("code")
GetLocal(1)
Native(5)
Pop
PushNil
Return
GetField("variables")
List(0)
Native(5)
Pop
GetField("depth")
PushInt(1)
Plus
SetField("depth")
PushNil
Return
GetField("variables")
Native(6)
GetField("depth")
PushInt(1)
Minus
SetField("depth")
Pop
PushNil
Return
GetField("depth")
PushInt(1)
Plus
SetField("depth")
PushNil
Return
GetField("variables")
Native(6)
GetLocal(1)
Native(3)
PushInt(0)
List(0)
GetLocal(3)
GetLocal(2)
Less
JumpIfFalse(3497)
GetLocal(1)
GetLocal(3)
IndexGet
Get("depth")
GetField("depth")
Equals
JumpIfFalse(3479)
PushSelf
PushString(148)
Call("push_code", 2)
Pop
GetLocal(1)
GetLocal(3)
IndexGet
Get("depth")
GetField("depth")
NotEquals
JumpIfFalse(3492)
GetLocal(4)
GetLocal(1)
GetLocal(3)
IndexGet
Native(5)
Pop
GetLocal(3)
PushInt(1)
Plus
SetLocal(3)
Jump(3464)
GetField("depth")
PushInt(1)
Minus
SetField("depth")
GetField("variables")
GetLocal(4)
Native(5)
Pop
Pop
Pop
Pop
Pop
PushNil
Return
GetField("variables")
Native(3)
PushInt(1)
Minus
GetField("variables")
GetField("variables")
Native(3)
PushInt(1)
Minus
IndexGet
PushInt(0)
PushNil
GetLocal(4)
GetLocal(3)
Native(3)
Less
JumpIfFalse(3547)
GetLocal(3)
GetLocal(4)
IndexGet
Get("name")
GetLocal(1)
Equals
JumpIfFalse(3542)
PushString(149)
GetLocal(1)
Plus
PushString(150)
Plus
Native(4)
Pop
GetLocal(4)
PushInt(1)
Plus
SetLocal(4)
Jump(3523)
PushString(151)
Print(1)
Pop
GetLocal(3)
GetLocal(1)
GetField("depth")
GetLocal(3)
Native(3)
GetLocal(2)
Plus
Instance(["stack_pos", "depth", "name"], [], [])
Native(5)
Pop
Pop
Pop
Pop
Pop
PushNil
Return
GetField("variables")
GetField("variables")
Native(3)
PushInt(1)
Minus
IndexGet
PushInt(0)
GetLocal(3)
GetLocal(2)
Native(3)
Less
JumpIfFalse(3595)
GetLocal(2)
GetLocal(3)
IndexGet
Get("name")
GetLocal(1)
Equals
JumpIfFalse(3590)
GetLocal(2)
GetLocal(3)
IndexGet
Get("stack_pos")
Return
GetLocal(3)
PushInt(1)
Plus
SetLocal(3)
Jump(3573)
PushNil
Return
Pop
Pop
PushNil
Return
PushInt(0)
GetLocal(2)
GetLocal(1)
Native(3)
Less
JumpIfFalse(3618)
GetLocal(1)
GetLocal(2)
IndexGet
PushSelf
Call("accept", 2)
Pop
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Jump(3602)
Pop
PushNil
Return
GetLocal(1)
PushString(152)
Equals
JumpIfFalse(3629)
PushInt(0)
PushInt(1)
List(2)
Return
GetLocal(1)
PushString(153)
Equals
JumpIfFalse(3637)
PushInt(1)
PushInt(1)
List(2)
Return
GetLocal(1)
PushString(154)
Equals
JumpIfFalse(3645)
PushInt(2)
PushInt(1)
List(2)
Return
GetLocal(1)
PushString(155)
Equals
JumpIfFalse(3653)
PushInt(3)
PushInt(1)
List(2)
Return
GetLocal(1)
PushString(156)
Equals
JumpIfFalse(3661)
PushInt(4)
PushInt(1)
List(2)
Return
GetLocal(1)
PushString(157)
Equals
JumpIfFalse(3669)
PushInt(5)
PushInt(2)
List(2)
Return
GetLocal(1)
PushString(158)
Equals
JumpIfFalse(3677)
PushInt(6)
PushInt(1)
List(2)
Return
GetLocal(1)
PushString(159)
Equals
JumpIfFalse(3685)
PushInt(7)
PushInt(2)
List(2)
Return
GetLocal(1)
PushString(160)
Equals
JumpIfFalse(3693)
PushInt(8)
PushInt(1)
List(2)
Return
GetLocal(1)
PushString(161)
Equals
JumpIfFalse(3701)
PushInt(9)
PushInt(2)
List(2)
Return
PushString(162)
GetLocal(1)
Plus
Native(4)
Pop
PushNil
Return
PushSelf
Call("begin_scope", 1)
Pop
PushSelf
GetLocal(1)
Get("nodes")
Call("compile_list", 2)
Pop
PushSelf
Call("end_scope", 1)
Pop
PushNil
Return
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(163)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(164)
Call("push_code", 2)
Pop
PushNil
Return
PushSelf
PushString(165)
GetLocal(1)
Get("value")
Native(1)
Plus
PushString(166)
Plus
Call("push_code", 2)
Pop
PushNil
Return
PushSelf
PushString(167)
GetLocal(1)
Get("value")
Native(1)
Plus
PushString(168)
Plus
Call("push_code", 2)
Pop
PushNil
Return
PushSelf
PushString(169)
GetField("strings")
Native(3)
Native(1)
Plus
PushString(170)
Plus
Call("push_code", 2)
Pop
GetField("strings")
GetLocal(1)
Get("value")
Native(5)
Pop
PushNil
Return
PushSelf
PushString(171)
GetLocal(1)
Get("value")
PushString(172)
Plus
Plus
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(173)
GetLocal(1)
Get("name")
PushString(174)
Plus
Plus
Call("push_code", 2)
Pop
PushNil
Return
PushSelf
GetLocal(1)
Get("items")
Call("compile_list", 2)
Pop
PushSelf
PushString(175)
GetLocal(1)
Get("items")
Native(3)
Native(1)
Plus
PushString(176)
Plus
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("indexer")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(177)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("indexer")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(178)
Call("push_code", 2)
Pop
PushNil
Return
PushSelf
PushString(179)
GetLocal(1)
Get("value")
Native(1)
Plus
PushString(180)
Plus
Call("push_code", 2)
Pop
PushNil
Return
PushSelf
PushString(181)
Call("push_code", 2)
Pop
PushNil
Return
PushSelf
GetLocal(1)
Get("value")
Call("get_local", 2)
GetLocal(2)
PushNil
NotEquals
JumpIfFalse(3901)
PushSelf
PushString(182)
GetLocal(2)
Native(1)
Plus
PushString(183)
Plus
Call("push_code", 2)
Pop
GetLocal(2)
PushNil
Equals
JumpIfFalse(3973)
PushSelf
GetLocal(1)
Get("value")
Call("find_class", 2)
GetLocal(3)
PushNil
Equals
JumpIfFalse(3916)
PushString(184)
Native(4)
Pop
GetLocal(3)
Get("fields")
Native(3)
PushInt(0)
NotEquals
JumpIfFalse(3925)
PushString(185)
Native(4)
Pop
List(0)
List(0)
PushInt(0)
GetLocal(6)
GetLocal(3)
Get("methods")
Native(3)
Less
JumpIfFalse(3955)
GetLocal(4)
GetLocal(3)
Get("methods")
GetLocal(6)
IndexGet
Get("name")
Native(5)
Pop
GetLocal(5)
GetLocal(3)
Get("methods")
GetLocal(6)
IndexGet
Get("code_start")
Native(5)
Pop
GetLocal(6)
PushInt(1)
Plus
SetLocal(6)
Jump(3928)
PushSelf
PushString(186)
GetLocal(4)
Native(1)
Plus
PushString(187)
Plus
GetLocal(5)
Native(1)
Plus
PushString(188)
Plus
Call("push_code", 2)
Pop
Pop
Pop
Pop
Pop
Pop
PushNil
Return
PushSelf
PushString(189)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
GetLocal(1)
Get("name")
Call("add_local", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(190)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(191)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("name")
SetField("current_class_name")
GetLocal(1)
Get("fields")
SetField("current_fields")
GetField("code")
Native(3)
PushSelf
PushString(192)
Call("push_code", 2)
Pop
PushSelf
GetLocal(1)
Get("name")
Call("find_class", 2)
PushNil
NotEquals
JumpIfFalse(4053)
PushString(193)
GetLocal(1)
Get("name")
PushString(194)
Plus
Plus
Native(4)
Pop
List(0)
PushInt(0)
GetLocal(4)
GetLocal(1)
Get("methods")
Native(3)
Less
JumpIfFalse(4122)
PushSelf
Call("begin_method", 1)
Pop
GetLocal(1)
Get("methods")
GetLocal(4)
IndexGet
PushInt(0)
GetLocal(6)
GetLocal(5)
Get("params")
Native(3)
Less
JumpIfFalse(4087)
PushSelf
GetLocal(5)
Get("params")
GetLocal(6)
IndexGet
Call("add_local", 2)
Pop
GetLocal(6)
PushInt(1)
Plus
SetLocal(6)
Jump(4069)
GetField("code")
Native(3)
GetLocal(5)
Get("block")
PushSelf
Call("accept", 2)
Pop
GetLocal(5)
Get("name")
GetLocal(7)
Instance(["code_start", "name"], [], [])
GetLocal(3)
GetLocal(8)
Native(5)
Pop
PushSelf
PushString(195)
Call("push_code", 2)
Pop
PushSelf
PushString(196)
Call("push_code", 2)
Pop
GetLocal(4)
PushInt(1)
Plus
SetLocal(4)
PushSelf
Call("end_method", 1)
Pop
Pop
Pop
Pop
Pop
Jump(4055)
GetField("code")
Native(3)
GetField("code")
GetLocal(2)
PushString(197)
GetLocal(5)
Native(1)
Plus
PushString(198)
Plus
IndexSet
PushNil
SetField("current_class_name")
PushNil
SetField("current_fields")
GetLocal(1)
Get("name")
GetLocal(1)
Get("fields")
GetLocal(3)
Instance(["methods", "fields", "name"], [], [])
GetField("classes")
GetLocal(6)
Native(5)
Pop
Pop
Pop
Pop
Pop
Pop
PushNil
Return
PushSelf
Call("begin_scope", 1)
Pop
PushSelf
GetLocal(1)
Get("stmts")
Call("compile_list", 2)
Pop
PushSelf
Call("end_scope", 1)
Pop
PushNil
Return
PushSelf
GetLocal(1)
Get("name")
Call("get_local", 2)
GetLocal(2)
PushNil
Equals
JumpIfFalse(4181)
PushString(199)
GetLocal(1)
Get("name")
Plus
Native(4)
Pop
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(200)
GetLocal(2)
Native(1)
Plus
PushString(201)
Plus
Call("push_code", 2)
Pop
Pop
PushNil
Return
PushSelf
GetLocal(1)
Get("name")
Call("find_class", 2)
GetLocal(2)
PushNil
Equals
JumpIfFalse(4212)
PushString(202)
GetLocal(1)
Get("name")
Plus
Native(4)
Pop
GetLocal(2)
Get("fields")
Native(3)
GetLocal(1)
Get("args")
Native(3)
NotEquals
JumpIfFalse(4223)
PushString(203)
Native(4)
Pop
List(0)
GetLocal(2)
Get("fields")
Native(3)
PushInt(1)
Minus
GetLocal(4)
PushInt(0)
GreaterEqual
JumpIfFalse(4245)
GetLocal(3)
GetLocal(2)
Get("fields")
GetLocal(4)
IndexGet
Native(5)
Pop
GetLocal(4)
PushInt(1)
Minus
SetLocal(4)
Jump(4229)
List(0)
List(0)
PushInt(0)
SetLocal(4)
GetLocal(4)
GetLocal(2)
Get("methods")
Native(3)
Less
JumpIfFalse(4276)
GetLocal(5)
GetLocal(2)
Get("methods")
GetLocal(4)
IndexGet
Get("name")
Native(5)
Pop
GetLocal(6)
GetLocal(2)
Get("methods")
GetLocal(4)
IndexGet
Get("code_start")
Native(5)
Pop
GetLocal(4)
PushInt(1)
Plus
SetLocal(4)
Jump(4249)
PushSelf
GetLocal(1)
Get("args")
Call("compile_list", 2)
Pop
PushSelf
PushString(204)
GetLocal(3)
Native(1)
Plus
PushString(205)
Plus
GetLocal(5)
Native(1)
Plus
PushString(206)
Plus
GetLocal(6)
Native(1)
Plus
PushString(207)
Plus
Call("push_code", 2)
Pop
Pop
Pop
Pop
Pop
Pop
PushNil
Return
PushSelf
GetLocal(1)
Get("name")
Call("native", 2)
GetLocal(1)
Get("name")
PushString(208)
NotEquals
GetLocal(1)
Get("args")
Native(3)
GetLocal(2)
PushInt(1)
IndexGet
NotEquals
And
JumpIfFalse(4327)
PushString(209)
Native(4)
Pop
PushSelf
GetLocal(1)
Get("args")
Call("compile_list", 2)
Pop
GetLocal(1)
Get("name")
PushString(210)
Equals
JumpIfFalse(4348)
PushSelf
PushString(211)
GetLocal(1)
Get("args")
Native(3)
Native(1)
Plus
PushString(212)
Plus
Call("push_code", 2)
Pop
GetLocal(1)
Get("name")
PushString(213)
NotEquals
JumpIfFalse(4364)
PushSelf
PushString(214)
GetLocal(2)
PushInt(0)
IndexGet
Native(1)
Plus
PushString(215)
Plus
Call("push_code", 2)
Pop
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushNil
NotEquals
JumpIfFalse(4377)
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("lhs")
PushNil
Equals
JumpIfFalse(4386)
PushSelf
PushString(216)
Call("push_code", 2)
Pop
PushSelf
GetLocal(1)
Get("args")
Call("compile_list", 2)
Pop
PushSelf
PushString(217)
GetLocal(1)
Get("name")
PushString(218)
Plus
GetLocal(1)
Get("args")
Native(3)
PushInt(1)
Plus
Native(1)
Plus
PushString(219)
Plus
Plus
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(220)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(221)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("condition")
PushSelf
Call("accept", 2)
Pop
GetField("code")
Native(3)
PushSelf
PushString(222)
Call("push_code", 2)
Pop
GetLocal(1)
Get("block")
PushSelf
Call("accept", 2)
Pop
GetField("code")
Native(3)
GetField("code")
GetLocal(2)
PushString(223)
GetLocal(3)
Native(1)
Plus
PushString(224)
Plus
IndexSet
Pop
Pop
PushNil
Return
GetLocal(1)
Get("expr")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(225)
Call("push_code", 2)
Pop
PushNil
Return
GetField("code")
Native(3)
GetLocal(1)
Get("condition")
PushSelf
Call("accept", 2)
Pop
GetField("code")
Native(3)
PushSelf
PushString(226)
Call("push_code", 2)
Pop
GetLocal(1)
Get("block")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(227)
GetLocal(2)
Native(1)
Plus
PushString(228)
Plus
Call("push_code", 2)
Pop
GetField("code")
GetLocal(3)
PushString(229)
GetField("code")
Native(3)
Native(1)
Plus
PushString(230)
Plus
IndexSet
Pop
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(231)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(232)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(233)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(234)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(235)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(236)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(237)
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(238)
GetLocal(1)
Get("field")
PushString(239)
Plus
Plus
Call("push_code", 2)
Pop
PushNil
Return
GetLocal(1)
Get("lhs")
PushSelf
Call("accept", 2)
Pop
GetLocal(1)
Get("rhs")
PushSelf
Call("accept", 2)
Pop
PushSelf
PushString(240)
GetLocal(1)
Get("field")
PushString(241)
Plus
Plus
Call("push_code", 2)
Pop
PushNil
Return
Jump(4924)
PushInt(0)
GetLocal(2)
GetLocal(1)
Get("nodes")
Native(3)
Less
JumpIfFalse(4774)
PushString(242)
GetLocal(2)
Print(2)
Pop
PushString(243)
GetLocal(1)
Get("nodes")
GetLocal(2)
IndexGet
Print(2)
Pop
GetLocal(1)
Get("nodes")
GetLocal(2)
IndexGet
PushSelf
Call("accept", 2)
GetLocal(3)
JumpIfFalse(4768)
PushString(244)
Print(1)
Pop
List(0)
PushInt(0)
GetLocal(5)
GetLocal(1)
Get("nodes")
GetLocal(2)
IndexGet
Get("imports")
Native(3)
Less
JumpIfFalse(4760)
PushString(245)
GetLocal(1)
Get("nodes")
GetLocal(2)
IndexGet
Get("imports")
GetLocal(5)
IndexGet
Print(2)
Pop
GetLocal(1)
Get("nodes")
GetLocal(2)
IndexGet
Get("imports")
GetLocal(5)
IndexGet
GetLocal(6)
Native(2)
PushString(246)
GetLocal(7)
Print(2)
Pop
GetLocal(7)
PushInt(0)
Instance(["p", "code"], ["whitespace", "is_done", "letter", "digit", "advance", "identifier", "number", "string", "single_char", "two_char", "next"], [242, 260, 267, 300, 333, 344, 390, 444, 534, 558, 657])
GetLocal(8)
PushNil
Instance(["peek_item", "item"], ["next", "peek"], [725, 740])
SetLocal(8)
GetLocal(8)
GetLocal(6)
Instance(["file", "lexer"], ["consume", "consume_identifier", "infix_prec", "field", "grouping", "parse_prefix", "match_infix_token", "call", "index", "get_or_set", "parse_infix", "parse_expr", "expr", "block", "param_list", "stmt_def", "stmt_class", "list", "stmt_if", "stmt_while", "stmt_return", "stmt_set_field", "native", "stmt", "parse_root", "stmt_import"], [1058, 1084, 1105, 1229, 1249, 1261, 1397, 1531, 1601, 1615, 1624, 1728, 1747, 1753, 1798, 1858, 1880, 1934, 1976, 1993, 2010, 2021, 2092, 2150, 2291, 2311])
GetLocal(9)
Call("parse_root", 1)
GetLocal(4)
GetLocal(10)
Native(5)
Pop
GetLocal(5)
PushInt(1)
Plus
SetLocal(5)
Pop
Pop
Pop
Pop
Pop
Jump(4702)
GetLocal(1)
Get("nodes")
GetLocal(2)
GetLocal(4)
Instance(["stmts"], ["accept"], [894])
IndexSet
Pop
Pop
GetLocal(2)
PushInt(1)
Plus
SetLocal(2)
Pop
Jump(4672)
Pop
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushBool(false)
Return
PushNil
Return
PushString(247)
Print(1)
Pop
PushBool(true)
Return
PushNil
Return
PushInt(0)
Native(8)
PushString(248)
GetLocal(0)
Print(2)
Pop
GetLocal(0)
Native(2)
PushString(249)
GetLocal(1)
Print(2)
Pop
GetLocal(1)
PushInt(0)
Instance(["p", "code"], ["whitespace", "is_done", "letter", "digit", "advance", "identifier", "number", "string", "single_char", "two_char", "next"], [242, 260, 267, 300, 333, 344, 390, 444, 534, 558, 657])
GetLocal(2)
PushNil
Instance(["peek_item", "item"], ["next", "peek"], [725, 740])
SetLocal(2)
GetLocal(2)
GetLocal(0)
Instance(["file", "lexer"], ["consume", "consume_identifier", "infix_prec", "field", "grouping", "parse_prefix", "match_infix_token", "call", "index", "get_or_set", "parse_infix", "parse_expr", "expr", "block", "param_list", "stmt_def", "stmt_class", "list", "stmt_if", "stmt_while", "stmt_return", "stmt_set_field", "native", "stmt", "parse_root", "stmt_import"], [1058, 1084, 1105, 1229, 1249, 1261, 1397, 1531, 1601, 1615, 1624, 1728, 1747, 1753, 1798, 1858, 1880, 1934, 1976, 1993, 2010, 2021, 2092, 2150, 2291, 2311])
GetLocal(3)
Call("parse_root", 1)
Instance([], ["visitAstRoot", "visitAstNeg", "visitAstNot", "visitAstFloat", "visitAstInt", "visitAstString", "visitAstGetField", "visitAstSetField", "visitAstList", "visitAstIndex", "visitAstIndexSet", "visitAstBool", "visitAstNil", "visitAstGetVar", "visitAstDef", "visitAstPlus", "visitAstClass", "visitAstBlock", "visitAstReassign", "visitAstInstance", "visitAstNative", "visitAstMethod", "visitAstPop", "visitAstEqualEqual", "visitAstIf", "visitAstReturn", "visitAstWhile", "visitAstOr", "visitAstAnd", "visitAstBangEqual", "visitAstGreater", "visitAstGreaterEqual", "visitAstLess", "visitAstLessEqual", "visitAstGet", "visitAstSet", "visitAstImport"], [4671, 4777, 4781, 4785, 4789, 4793, 4797, 4801, 4805, 4809, 4813, 4817, 4821, 4825, 4829, 4833, 4837, 4841, 4845, 4849, 4853, 4857, 4861, 4865, 4869, 4873, 4877, 4881, 4885, 4889, 4893, 4897, 4901, 4905, 4909, 4913, 4917])
GetLocal(4)
GetLocal(5)
Call("accept", 2)
Pop
List(0)
PushBool(true)
Instance(["is_last", "indent"], ["print_node", "add_indent", "pop_indent", "loop", "visitAstRoot", "visitAstNeg", "visitAstNot", "visitAstGetSelf", "visitAstFloat", "visitAstInt", "visitAstString", "visitAstGetField", "visitAstSetField", "visitAstList", "visitAstIndex", "visitAstIndexSet", "visitAstBool", "visitAstNil", "visitAstGetVar", "visitAstDef", "visitAstPlus", "visitAstMinus", "visitAstClass", "visitAstBlock", "visitAstReassign", "visitAstInstance", "visitAstNative", "visitAstMethod", "visitAstPop", "visitAstEqualEqual", "visitAstIf", "visitAstReturn", "visitAstWhile", "visitAstOr", "visitAstAnd", "visitAstBangEqual", "visitAstGreater", "visitAstGreaterEqual", "visitAstLess", "visitAstLessEqual", "visitAstGet", "visitAstSet"], [2389, 2428, 2443, 2448, 2485, 2496, 2515, 2534, 2540, 2551, 2562, 2573, 2584, 2608, 2619, 2645, 2676, 2688, 2694, 2705, 2727, 2753, 2779, 2877, 2888, 2910, 2924, 2938, 3027, 3046, 3072, 3098, 3117, 3141, 3167, 3193, 3219, 3245, 3271, 3297, 3323, 3345])
GetLocal(4)
GetLocal(6)
Call("accept", 2)
Pop
PushNil
PushNil
PushNil
PushNil
PushNil
PushNil
PushNil
Instance(["current_class_name", "current_fields", "classes", "depth", "variables", "strings", "code"], ["init", "find_class", "push_code", "begin_method", "end_method", "begin_scope", "end_scope", "add_local", "get_local", "compile_list", "native", "visitAstRoot", "visitAstNeg", "visitAstNot", "visitAstFloat", "visitAstInt", "visitAstString", "visitAstGetField", "visitAstSetField", "visitAstList", "visitAstIndex", "visitAstIndexSet", "visitAstBool", "visitAstNil", "visitAstGetVar", "visitAstGetSelf", "visitAstDef", "visitAstPlus", "visitAstMinus", "visitAstClass", "visitAstBlock", "visitAstReassign", "visitAstInstance", "visitAstNative", "visitAstMethod", "visitAstPop", "visitAstEqualEqual", "visitAstIf", "visitAstReturn", "visitAstWhile", "visitAstOr", "visitAstAnd", "visitAstBangEqual", "visitAstGreater", "visitAstGreaterEqual", "visitAstLess", "visitAstLessEqual", "visitAstGet", "visitAstSet"], [3380, 3400, 3427, 3433, 3443, 3452, 3458, 3511, 3566, 3601, 3621, 3708, 3721, 3732, 3743, 3755, 3767, 3784, 3795, 3811, 3829, 3845, 3866, 3878, 3884, 3976, 3982, 3994, 4010, 4026, 4154, 4167, 4198, 4307, 4367, 4411, 4422, 4438, 4469, 4480, 4521, 4537, 4553, 4569, 4585, 4601, 4617, 4633, 4649])
GetLocal(7)
Call("init", 1)
Pop
GetLocal(4)
GetLocal(7)
Call("accept", 2)
Pop
PushInt(0)
GetLocal(8)
GetLocal(7)
Get("code")
Native(3)
Less
JumpIfFalse(4993)
GetLocal(7)
Get("code")
GetLocal(8)
IndexGet
Print(1)
Pop
GetLocal(8)
PushInt(1)
Plus
SetLocal(8)
Jump(4976)
PushString(250)
GetLocal(7)
Get("code")
Print(2)
Pop
PushString(251)
GetLocal(7)
Get("strings")
Print(2)
Pop
Pop
Pop
Pop
Pop
Pop
Pop
Pop
Pop
Pop