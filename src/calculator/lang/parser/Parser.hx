package calculator.lang.parser;

import calculator.lang.util.Cursor;
import calculator.lang.AST.Token;
import calculator.lang.AST.Expression;
import calculator.lang.Exception.ParserException;

import haxe.ds.GenericStack;

class Parser {
    static var stack : GenericStack<Expression>;
    static var cursor : Cursor<Token>;
    
    public static function run(tokens : Array<Token>) : Expression {
        cursor = new Cursor<Token>(tokens);
        stack = new GenericStack<Expression>();

        while (cursor.hasNext()) {
            stack.add(parseExpression());
        }

        return stack.pop();
    }

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

    static function parseBinOp(op : String) : Expression {
        if (stack.isEmpty())
            throw ParserException.Expected('expression');

        var left = stack.pop();
        cursor.next();

        switch (op) {
            case '+': return parseOpAdd(left);
            case '-': return parseOpSub(left);
            case _: throw ParserException.IllegalOp(op);
        }
    }

    static function parseNumber(n : String) : Expression {
        return Expression.Number(Std.parseFloat(n));
    }

    static function parseOpAdd(left : Expression) : Expression {
        return Expression.OpAdd(left, parseExpression());
    }

    static function parseOpSub(left : Expression) : Expression {
        return Expression.OpSub(left, parseExpression());
    }
}
