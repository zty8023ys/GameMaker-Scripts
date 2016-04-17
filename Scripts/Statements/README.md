###A collections of scripts mimicing statements/functions in GML.
NOTE: FOR(), FOR2D() and FOREACH() rely on the IF() script. However this can be removed by replacing with a normal if-statement.

--
#####IF(expression, true-result, false-result)
A simple pseudo ternary script which returns a result based on a given expression.
 - Upside: In-lined if-statements.
 - Downside: Not true ternary, so result parameters will be prematurely calculated.

--
#####FOR(begin, end, increment, script, params[undefined], dispose[false])
Executes a script over a for-loop with the current iteration number and parameters(ds-list) passed to the script.

The `params` will default to undefined if not passed. If params are passed and `disposed` is set to true the `params` will be freed from memory after execution.
 - Upside: Easy to write and use.
 - Downside: Less flexible than using a normal for-loop.
 
--
#####FOREACH(script, params, dispose[false])
Executes a script for each item in the parameters(ds-list) and passes the item and parameters to the script.

If `dispose` is set to true the `params` will be freed from memory after execution.
 - Upside: Easy to write and use.
 - Downside: Less flexible than using a normal for-loop.
 
--
#####FOR2D(x-begin, y-begin, x-increment, y-begin, y-end, y-increment, script, params[undefined], dispose[false])
Essentially the same as FOR(...) except using nested for-loops. The outter loop is the y-iteration and the inner loop is the x-iteration.

The `params` will default to undefined if not passed. If params are passed and `disposed` is set to true the `params` will be freed from memory after execution.
 - Upside: Easy to write and use.
 - Downside: Less flexible than using a normal for-loop.
 
--
#####RANGE(x1, y1, val)
(inlined) Checks if a value(`val`) is within a given range of `x1`,`y1`.

--
#####INTERSECT(x1, y1, x2, y2)
(inlined) Checks if two ranges `x1`,`y1` and `x2`,`y2` are intersecting.

--
#####UNDEFINABLE(val)
(inlined) A wrapper script for is_undefined(val).

--
#####THROW(error[generic error], abort[false])
Throws an error with the given error message and whether to abort the game or not. If no message and abort mode are given a generic error will be displayed.
