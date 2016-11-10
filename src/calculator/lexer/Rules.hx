package calculator.lexer;

/**
 * Parsing the source is done according to the rules defined in this
 * class.
 */
@:publicFields
class Rules {
    /**
     * Checks if the character is a digit in range [0-9].
     *
     * @param char - Character
     * @return `true` if digit in range [0-9]
     */
    static function isDigit(char : String) : Bool {
        return ~/[0-9]/.match(char);
    }

    /**
     * Checks if the character is a decimal point (.).
     *
     * @param char - Character
     * @return `true` if decimal point (.)
     */
    static function isDecimalPoint(char : String) : Bool {
        return ~/\./.match(char);
    }

    /**
     * Checks if the character is whitespace (tab or space).
     *
     * @param char - Character
     * @return `true` if whitespace (tab or space)
     */
    static function isWhitespace(char : String) : Bool {
        return ~/\s|\t/.match(char);
    }

    /**
     * Checks if the character is an operation symbol (+, -, *, /).
     *
     * @param char - Character
     * @return `true` if operation symbol (+, -, *, /)
     */
    static function isOperationSymbol(char : String) : Bool {
        return ~/\+|\-|\*|\//.match(char);
    }

    /**
     * Checks if the character marks "end of field".
     *
     * @param char - Character
     * @return `true` if "end of field"
     */
    static function isEof(char : String) : Bool {
        return char == "";
    }
}
