package calculator.lang.parser;

/**
 * Parsing the source is done according to the rules defined in this
 * class.
 */
@:publicFields
class Rules {
    /**
     * Checks if the character is a symbol representing the addition
     * operation.
     *
     * @param char - Character
     * @return `true` if character is addition symbol
     */
    static function isOpAdd(char : String) : Bool {
        return ~/\+/.match(char);
    }

    /**
     * Checks if the character is a symbol representing the
     * subtraction operation.
     *
     * @param char - Character
     * @return `true` if character is subtraction symbol
     */
    static function isOpSub(char : String) : Bool {
        return ~/\-/.match(char);
    }
}
