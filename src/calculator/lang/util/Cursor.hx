package calculator.lang.util;

/**
 * A cursor is a "window" into an array of types `T`. It allows the
 * array to be observed on a per-element basis, until the end of the
 * array is reached.
 */
class Cursor<T> {
    /**
     * Current cursor position in array. Read-only.
     */
    public var position(default, null) : Int;

    /**
     * The array observed by the cursor.
     */
    var source : Array<T>;

    /**
     * Creates a new cursor that observes an array of types `T`.
     *
     * @param source Observed array
     */
    public function new(source : Array<T>) : Void {
        this.source = source;
        rewind();
    }

    /**
     * Checks if next element is observable.
     *
     * @return `true` if next element is observable
     */
    public function hasNext() : Bool {
        return position + 1 < source.length;
    }

    /**
     * Consumes the next element in the array and returns it. This
     * operation changes the cursor position.
     *
     * @return Next element in array
     */
    public function next() : T {
        return source[++position];
    }

    /**
     * Peeks at the next element in the array and returns it. This
     * operation does not change the cursor position.
     *
     * @return Next element in array
     */
    public function peek() : T {
        return source[position + 1];
    }

    /**
     * Rewinds cursor to starting position.
     */
    public function rewind() : Void {
        position = -1;
    }
}
