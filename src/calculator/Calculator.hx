package calculator;

import calculator.lexer.Lexer;

class Calculator {
    static function main() : Void {
        trace(Lexer.run("123.5 +  12 -    6    * 2/4"));
    }
}
