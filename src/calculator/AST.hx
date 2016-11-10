package calculator;

/**
 * Tokens are produced by lexical analysis of a given input string.
 * A token contextualises a character or series of characters from
 * the input giving it a certain meaning.
 */
enum Token {
    Operand(c : String);
    Operation(o : String);
    Illegal(i : String);
}
