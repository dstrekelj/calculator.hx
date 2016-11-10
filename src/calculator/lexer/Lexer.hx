package calculator.lexer;

import calculator.lexer.Reader.*;
import calculator.lexer.Rules.*;

/**
 * The lexer performs a lexical analysis of the source string and
 * creates tokens in the process.
 */
class Lexer {
    /**
     * Runs lexical analysis on provided source string.
     *
     * @param source - Source string
     * @return Array of tokens
     */
    public static function run(source : String) : Array<AST.Token> {
        var cursor = new Cursor(source);
        var tokens = new Array<AST.Token>();

        while (!isEof(cursor.peek())) {
            switch (cursor.peek()) {
                case char if (isDigit(char)):
                    tokens.push(readOperand(cursor));
                case char if (isWhitespace(char)):
                    readWhitespace(cursor);
                case char if (isOperationSymbol(char)):
                    tokens.push(readOperation(cursor));
                case char:
                    tokens.push(AST.Token.Illegal(cursor.next()));
            }
        }

        return tokens;
    }
}
