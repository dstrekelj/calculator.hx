package lexer;

@:publicFields
class Rules
{
    static function isDigit(char : String) : Bool
    {
        return ~/[0-9]/.match(char);
    }

    static function isDecimalPoint(char : String) : Bool
    {
        return ~/\./.match(char);
    }

    static function isWhitespace(char : String) : Bool
    {
        return ~/\s|\t/.match(char);
    }

    static function isOperatorSymbol(char : String) : Bool
    {
        return ~/\+|\-|\*|\//.match(char);
    }

    static function isEof(char : String) : Bool
    {
        return char == "";
    }
}