package calculator;

import calculator.lang.lexer.Lexer;
import calculator.lang.util.Log;
import calculator.lang.Exception.LexerException;

/**
 * Application entry point.
 *
 * This calculator application aims to provide a brief introduction
 * to performing lexing and parsing of text input, and using the
 * results to perform certain actions.
 *
 * In the context of the calculator, the text input represents a
 * mathematical equation. A lexer tokenizes the input into operations
 * and operands, and passes it to a parser which uses the
 * contextualised data to calculate the result. 
 */
class Calculator {
    static function main() : Void {
        try {
            var lexer = Lexer.run("1 + 2.5 - 345 * 8");
            trace(lexer);
        } catch (e : LexerException) {
            Log.lexerException(e);
        }
    }
}
