package lexer;

import lexer.Reader.*;
import lexer.Rules.*;

class Lexer
{
    public static function run(source : String) : Array<AST.Token>
    {
        var cursor = new Cursor(source);
        var tokens = new Array<AST.Token>();

        while (!isEof(cursor.peek()))
        {
            switch (cursor.peek())
            {
                case char if (isDigit(char)):
                    tokens.push(readNumber(cursor));
                case char if (isWhitespace(char)):
                    readWhitespace(cursor);
                case char if (isOperatorSymbol(char)):
                    tokens.push(readOperator(cursor));
                case char:
                    tokens.push(AST.Token.Illegal(cursor.next()));
            }
        }

        return tokens;
    }
}