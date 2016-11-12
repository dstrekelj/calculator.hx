package calculator.lang;

import calculator.lang.util.Cursor;
import calculator.lang.AST.Token;
import calculator.lang.AST.Expression;
import calculator.lang.Exception.ParserException;

import haxe.ds.GenericStack;

/**
 * The parser parses an array of tokens to see if they fit the grammar
 * defined through parsing rules. The result of the parsing process
 * is an abstract syntax tree.
 *
 * @todo Refactor into several smaller, more maintainable classes.
 */
class Parser {
    /**
     * A stack is necessary to keep track of parsed expressions that
     * may be used later (e.g. left-hand side of a binary operation).
     */
    static var stack : GenericStack<Expression>;

    /**
     * A cursor to peek at tokens.
     */
    static var cursor : Cursor<Token>;

    /**
     * Runs parser over an array of tokens.
     *
     * @param tokens - An array of tokens
     * @return Expression, as per the AST
     */
    public static function run(tokens : Array<Token>) : Expression {
        cursor = new Cursor<Token>(tokens);
        stack = new GenericStack<Expression>();

        while (cursor.hasNext()) {
            stack.add(parseExpression());
        }

        return stack.pop();
    }

    /**
     * Parses an expression.
     *
     * @return Expression
     */
    static function parseExpression() : Expression {
        switch (cursor.peek()) {
            case Token.Operand(o):
                cursor.next();
                return parseNumber(o);
            case Token.Operation(op):
                return parseBinOp(op);
            case _:
                throw ParserException.IllegalToken(cursor.next());
        }
    }

    /**
     * Parses a binary operation.
     *
     * @param op - Operation symbol
     * @return Expression
     */
    static function parseBinOp(op : String) : Expression {
        if (stack.isEmpty())
            throw ParserException.Expected('expression');

        var left = stack.pop();
        cursor.next();
        
        if (!cursor.hasNext())
            throw ParserException.Expected('expression');

        switch (op) {
            case '+': return parseOpAdd(left);
            case '-': return parseOpSub(left);
            case _: throw ParserException.IllegalOp(op);
        }
    }

    /**
     * Parses a number.
     *
     * @param n - Value, as string
     * @return Expression
     */
    static function parseNumber(n : String) : Expression {
        return Expression.Number(Std.parseFloat(n));
    }

    /**
     * Parses an addition operation.
     *
     * @param left - Left hand side of the operation
     * @return Expression
     */
    static function parseOpAdd(left : Expression) : Expression {
        return Expression.OpAdd(left, parseExpression());
    }

    /**
     * Parses a subtraction operation.
     *
     * @param left - Left hand side of the operation
     * @return Expression
     */
    static function parseOpSub(left : Expression) : Expression {
        return Expression.OpSub(left, parseExpression());
    }
}
