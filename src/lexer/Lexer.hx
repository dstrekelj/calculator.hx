package lexer;

class Lexer
{
    public static function run(source : String) : Array<AST.Token>
    {
        var cursor = new Cursor(source);
        var tokens = new Array<AST.Token>();

        while (!Rules.isEof(cursor.peek()))
        {
            switch (cursor.peek())
            {
                case char if (Rules.isDigit(char)):
                    tokens.push(readNumber(cursor));
                case char if (Rules.isWhitespace(char)):
                    readWhitespace(cursor);
                case char if (Rules.isOperatorSymbol(char)):
                    tokens.push(readOperator(cursor));
                case char:
                    tokens.push(AST.Token.Illegal("Unknown"));
            }
        }

        return tokens;
    }

    static function readWhitespace(cursor : Cursor) : Void
    {
        while (Rules.isWhitespace(cursor.peek()))
        {
            cursor.next();
        }
    }

    static function readNumber(cursor : Cursor) : AST.Token
    {
        var accumulator = new StringBuf();

        var isDecimal = false;

        while (Rules.isDigit(cursor.peek()) || Rules.isDecimalPoint(cursor.peek()))
        {   
            switch (cursor.next())
            {
                case char if (Rules.isDigit(char)):
                    accumulator.add(char);
                case char if (Rules.isDecimalPoint(char)):
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

        while (Rules.isOperatorSymbol(cursor.peek()))
        {
            switch (cursor.next())
            {
                case char if (Rules.isOperatorSymbol(char)):
                    accumulator.add(char);
                case _:
            }
        }
        
        return AST.Token.Operator(accumulator.toString());
    }
}