package calculator;

import calculator.Exception.LexerException;

@:publicFields
class Log {
    static function lexerException(e : LexerException) : Void {
        switch (e) {
            case LexerException.IllegalChar(c, p):
                trace('LexerException: Illegal character "$c" at position $p');
        }
    }
}
