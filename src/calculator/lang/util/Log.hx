package calculator.lang.util;

import calculator.lang.Exception.LexerException;
import calculator.lang.Exception.ParserException;

/**
 * This class provides functions for logging exceptions to the process
 * standard output.
 */
@:publicFields
class Log {
    /**
     * Logs a lexer exception to the process standard output.
     *
     * @param e Lexer exception
     */
    static function lexerException(e : LexerException) : Void {
        switch (e) {
            case LexerException.IllegalChar(c, p):
                trace('LexerException: Illegal character "$c" at position $p');
        }
    }

    /**
     * Logs a parser exception to the process standard output.
     *
     * @param e Parser exception
     */
    static function parserException(e : ParserException) : Void {
        switch (e) {
            case ParserException.Expected(e):
                trace('ParserException: Expected $e');
            case ParserException.IllegalOp(o):
                trace('ParserException: Illegal operation $o');
            case ParserException.IllegalToken(t):
                trace('ParserException: Illegal token $t');
        }
    }
}
