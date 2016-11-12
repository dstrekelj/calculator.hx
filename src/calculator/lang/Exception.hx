package calculator.lang;

import calculator.lang.AST.Token;

enum LexerException {
    IllegalChar(c : String, p : Int);
}

enum ParserException {
    Expected(e : String);
    IllegalOp(o : String);
    IllegalToken(t : Token);
}
