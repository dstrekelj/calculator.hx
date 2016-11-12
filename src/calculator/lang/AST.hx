package calculator.lang;

/**
 * Tokens are produced by lexical analysis of a given input string.
 * A token contextualises a character or series of characters from
 * the input giving it a certain meaning.
 */
enum Token {
    Operand(o : String);
    Operation(o : String);
}

enum Expression {
    Number(n : Float);
    OpAdd(a : Expression, b : Expression);
    OpDiv(a : Expression, b : Expression);
    OpMul(a : Expression, b : Expression);
    OpSub(a : Expression, b : Expression);
}
