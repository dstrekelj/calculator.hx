package calculator.lexer;

import calculator.lexer.Rules.*;
import calculator.AST;

@:publicFields
class Reader {
    static function readWhitespace(cursor : Cursor) : Void {
        while (isWhitespace(cursor.peek())) cursor.next();
    }

    static function readNumber(cursor : Cursor) : AST.Token {
        var accumulator = new StringBuf();
        var foundDecimal = false;

        while (isDigit(cursor.peek()) || isDecimalPoint(cursor.peek())) {   
            switch (cursor.next()) {
                case char if (isDigit(char)):
                    accumulator.add(char);
                case char if (isDecimalPoint(char)):
                    if (!foundDecimal) {
                        accumulator.add(char);
                        foundDecimal = true;
                    } else {
                        return AST.Token.Illegal(accumulator.toString());
                    }
                case _:
            }
        }
        
        return AST.Token.Constant(accumulator.toString());
    }

    static function readOperator(cursor : Cursor) : AST.Token {
        var accumulator = new StringBuf();

        while (isOperatorSymbol(cursor.peek())) {
            switch (cursor.next()) {
                case char if (isOperatorSymbol(char)):
                    accumulator.add(char);
                case _:
            }
        }
        
        return AST.Token.Operator(accumulator.toString());
    }
}
