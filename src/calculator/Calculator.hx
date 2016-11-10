package calculator;

import calculator.lexer.Lexer;

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
        trace(Lexer.run("123.5 +  12 -    6    * 2/4"));
    }
}
