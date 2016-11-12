package calculator.lang.lexer;

import calculator.lang.lexer.Rules.*;
import calculator.lang.util.Cursor;
import calculator.lang.AST.Token;
import calculator.lang.Exception.LexerException;

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
    static function readWhitespace(cursor : Cursor<String>) : Void {
        while (cursor.hasNext() && isWhitespace(cursor.peek()))
            cursor.next();
    }

    /**
     * Reads all operand characters beginning with the current cursor
     * position.
     *
     * @param cursor - Cursor observing source
     * @return Operand token containing read value
     */
    static function readOperand(cursor : Cursor<String>) : Token {
        var accumulator = new StringBuf();
        var foundDecimal = false;

        while (cursor.hasNext() && (isDigit(cursor.peek()) || isDecimalPoint(cursor.peek()))) {   
            switch (cursor.next()) {
                case char if (isDigit(char)):
                    accumulator.add(char);
                case char if (isDecimalPoint(char)):
                    if (!foundDecimal) {
                        accumulator.add(char);
                        foundDecimal = true;
                    } else {
                        throw LexerException.IllegalChar(char, cursor.position);
                    }
                case _:
            }
        }
        
        return Token.Operand(accumulator.toString());
    }

    /**
     * Reads all operation characters beginning with the current
     * cursor position.
     *
     * @param cursor - Cursor observing source
     * @return Operation token containing read value
     */
    static function readOperation(cursor : Cursor<String>) : Token {
        var accumulator = new StringBuf();

        while (cursor.hasNext() && isOperationSymbol(cursor.peek())) {
            accumulator.add(cursor.next());
        }
        
        return Token.Operation(accumulator.toString());
    }
}
