package calculator.lexer;

import calculator.lexer.Rules.*;
import calculator.AST;

/**
 * The source string is read (traversed) with the functions defined in
 * this class.
 */
@:publicFields
class Reader {
    /**
     * Reads all whitespace characters beginning with the current
     * cursor position.
     *
     * @param cursor - Cursor observing source
     */
    static function readWhitespace(cursor : Cursor) : Void {
        while (isWhitespace(cursor.peek())) cursor.next();
    }

    /**
     * Reads all operand characters beginning with the current cursor
     * position.
     *
     * @param cursor - Cursor observing source
     * @return Operand token containing read value
     */
    static function readOperand(cursor : Cursor) : AST.Token {
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
        
        return AST.Token.Operand(accumulator.toString());
    }

    /**
     * Reads all operation characters beginning with the current
     * cursor position.
     *
     * @param cursor - Cursor observing source
     * @return Operation token containing read value
     */
    static function readOperation(cursor : Cursor) : AST.Token {
        var accumulator = new StringBuf();

        while (isOperationSymbol(cursor.peek())) {
            switch (cursor.next()) {
                case char if (isOperationSymbol(char)):
                    accumulator.add(char);
                case _:
            }
        }
        
        return AST.Token.Operation(accumulator.toString());
    }
}
