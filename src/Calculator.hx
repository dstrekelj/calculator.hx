class Calculator
{
    static function main() : Void
    {
        trace(lexer.Lexer.run("123.5 +  12 -    6    * 2/4"));
    }
}
