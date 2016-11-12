package calculator;

import calculator.lang.Interpreter;
import calculator.lang.Lexer;
import calculator.lang.Parser;
import calculator.lang.util.Log;
import calculator.lang.Exception.InterpreterException;
import calculator.lang.Exception.LexerException;
import calculator.lang.Exception.ParserException;

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
            var tokens = Lexer.run("1+2-");
            trace(tokens);
            var expression = Parser.run(tokens);
            trace(expression);
            var result = Interpreter.run(expression);
            trace(result);
        } catch (le : LexerException) {
            Log.lexerException(le);
        } catch (pe : ParserException) {
            Log.parserException(pe);
        } catch (ie : InterpreterException) {
            Log.interpreterException(ie);
        }
    }
}
