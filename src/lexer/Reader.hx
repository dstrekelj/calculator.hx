package lexer;

import lexer.Rules.*;

@:publicFields
class Reader
{
    static function readWhitespace(cursor : Cursor) : Void
    {
        while (isWhitespace(cursor.peek()))
        {
            cursor.next();
        }
    }

    static function readNumber(cursor : Cursor) : AST.Token
    {
        var accumulator = new StringBuf();

        var isDecimal = false;

        while (isDigit(cursor.peek()) || isDecimalPoint(cursor.peek()))
        {   
            switch (cursor.next())
            {
                case char if (isDigit(char)):
                    accumulator.add(char);
                case char if (isDecimalPoint(char)):
                    if (!isDecimal) 
                    {
                        accumulator.add(char);
                        isDecimal = true;
                    }
                    else
                    {
                        return AST.Token.Illegal(accumulator.toString());
                    }
                case _:
            }
        }
        
        return AST.Token.Constant(accumulator.toString());
    }

    static function readOperator(cursor : Cursor) : AST.Token
    {
        var accumulator = new StringBuf();

        while (isOperatorSymbol(cursor.peek()))
        {
            switch (cursor.next())
            {
                case char if (isOperatorSymbol(char)):
                    accumulator.add(char);
                case _:
            }
        }
        
        return AST.Token.Operator(accumulator.toString());
    }
}
