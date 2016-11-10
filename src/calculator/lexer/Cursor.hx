package calculator.lexer;

class Cursor {
    public var position(default, null) : Int;
    
    var source : String;

    public function new(source : String) : Void {
        this.source = source;
        rewind();
    }

    public function rewind() : Void {
        this.position = -1;
    }

    public function next() : String {
        return this.source.charAt(++this.position);
    }

    public function peek() : String {
        return this.source.charAt(this.position + 1);
    }
}
