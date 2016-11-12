package calculator.lang;

import calculator.lang.AST.Token;

/**
 * Possible exceptions thrown by the interpreter.
 */
enum InterpreterException {
    /** Attempt to interpret unknown / unhandled expression. */
    IllegalExpression;
}

/**
 * Possible exceptions thrown by the lexer.
 */
enum LexerException {
    /** Attempt to tokenize an unknown / unhandled character. */
    IllegalChar(c : String, p : Int);
}

/**
 * Possible exceptions thrown by the parser.
 */
enum ParserException {
    /** Attempt to parse this token, but it doesn't exist. */
    Expected(e : String);
    /** Attempt to parse an unknown / unhandled operation. */
    IllegalOp(o : String);
    /** Attempt to parse an unknown / unhandled token. */
    IllegalToken(t : Token);
}
