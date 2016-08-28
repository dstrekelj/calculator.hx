class Lexer
{
    public static function run(source : String) : Void
    {
        var cursor = new Cursor();
        var tokens = new Array<AST.Token>();

        while (preview(source, cursor) != "")
        {
            switch (preview(source, cursor))
            {
                case char if (isDigit(char)):
                    tokens.push(readNumber(source, cursor));
                case char if (isWhitespace(char)):
                    // Do nothing
                case char if (isOperation(char)):
                    tokens.push(AST.Token.Operation);
                case char:
                    tokens.push(AST.Token.Illegal);
            }
            next(source, cursor);
        }

        trace(tokens);
    }

    static function preview(source : String, cursor : Cursor) : String
    {
        return source.charAt(cursor.position + 1);
    }

    static function next(source : String, cursor : Cursor) : String
    {
        cursor.move();
        return source.charAt(cursor.position);
    }

    static function readNumber(source : String, cursor : Cursor) : AST.Token
    {
        var accumulator = new StringBuf();

        while (preview(source, cursor) != "" && !isWhitespace(preview(source, cursor)))
        {
            switch (next(source, cursor))
            {
                case char if (isDigit(char)):
                    accumulator.add(char);
                case _:
            }
        }
        
        return AST.Token.Number(accumulator.toString());
    }

    static function isDigit(char : String) : Bool
    {
        return ~/[0-9]/.match(char);
    }

    static function isWhitespace(char : String) : Bool
    {
        return ~/\s|\t/.match(char);
    }

    static function isOperation(char : String) : Bool
    {
        return ~/\+|\-|\*|\//.match(char);
    }
}

private class Cursor
{
    public var position(default, null) : Int;

    public function new() : Void
    {
        rewind();
    }

    public function rewind() : Void
    {
        this.position = -1;
    }

    public function move() : Void
    {
        this.position += 1;
    }
}