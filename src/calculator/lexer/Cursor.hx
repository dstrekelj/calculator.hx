package calculator.lexer;

/**
 * The cursor is a 'window' into a certain character of the input
 * source string.
 */
class Cursor {
    /**
     * Current cursor position, in terms of currently observed
     * input character.
     */
    public var position(default, null) : Int;
    
    /**
     * Input source string.
     */
    var source : String;

    /**
     * Creates new cursor observing the provided source string.
     *
     * @param source - Input source string
     */
    public function new(source : String) : Void {
        this.source = source;
        rewind();
    }

    /**
     * Rewinds the cursor to its starting position.
     */
    public function rewind() : Void {
        this.position = -1;
    }

    /**
     * Consumes the current input character and moves onto the next
     * position in the source string.
     *
     * @return Currently observed character
     */
    public function next() : String {
        return this.source.charAt(++this.position);
    }

    /**
     * Peeks at the source string character that follows.
     * 
     * @return Next character to be observed
     */
    public function peek() : String {
        return this.source.charAt(this.position + 1);
    }
}
