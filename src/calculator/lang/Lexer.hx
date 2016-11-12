package calculator.lang;

import calculator.lang.lexer.Reader.*;
import calculator.lang.lexer.Rules.*;
import calculator.lang.util.Cursor;
import calculator.lang.AST.Token;
import calculator.lang.Exception.LexerException;

/**
 * The lexer performs a lexical analysis of the source string and
 * creates tokens in the process.
 */
 @:publicFields
class Lexer {
    /**
     * Runs lexical analysis on provided source string.
     *
     * @param source - Source string
     * @return Array of tokens
     */
    static function run(source : String) : Array<Token> {
        var cursor = new Cursor<String>(source.split(""));
        var tokens = new Array<Token>();

        while (cursor.hasNext()) {
            switch (cursor.peek()) {
                case char if (isDigit(char)):
                    tokens.push(readOperand(cursor));
                case char if (isWhitespace(char)):
                    readWhitespace(cursor);
                case char if (isOperationSymbol(char)):
                    tokens.push(readOperation(cursor));
                case char:
                    throw LexerException.IllegalChar(char, cursor.position);
            }
        }

        return tokens;
    }
}
