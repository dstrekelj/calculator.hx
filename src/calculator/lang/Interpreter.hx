package calculator.lang;

import calculator.lang.AST.Expression;
import calculator.lang.Exception.InterpreterException;

/**
 * The interpreter goes over the AST - beginning with the root
 * expression node - and returns a result.
 */
class Interpreter {
    /**
     * Runs the interpreter from the root expression node.
     *
     * @param expression - Root expression node
     * @return Interpretation result
     */
    public static function run(expression : Expression) : Float {
        return interpretExpression(expression);
    }

    /**
     * Interprets an expression.
     *
     * @param expression - Expression node
     * @return Interpretation result
     */
    static function interpretExpression(expression : Expression) : Float {
        return switch(expression) {
            case Expression.Number(v):
                return v;
            case Expression.OpAdd(a, b):
                return interpretOpAdd(a, b);
            case Expression.OpSub(a, b):
                return interpretOpSub(a, b);
            case _:
                throw InterpreterException.IllegalExpression;
        }
    }

    /**
     * Interprets an addition operation expression.
     *
     * @param left - Expression on the left-hand side
     * @param right - Expression on the right-hand side
     * @return Interpretation result
     */
    static function interpretOpAdd(left : Expression, right : Expression) : Float {
        return interpretExpression(left) + interpretExpression(right);
    }

    /**
     * Interprets a subtraction operation expression.
     *
     * @param left - Expression on the left-hand side
     * @param right - Expression on the right-hand side
     * @return Interpretation result
     */
    static function interpretOpSub(left : Expression, right : Expression) : Float {
        return interpretExpression(left) - interpretExpression(right);
    }
}
