# GameMaker-Scripts
A collection of reusable scripts for GameMaker: Studio. Some scripts may have dependency scripts in the same set or file.


#Favorites
#####DS Object
The DS Object scripts are great for encapsulating the GameMaker data structures as generic objects with their stored type. This means you can write scripts to perform generic operations that are possibly across all of the data structures without having to specify which type of data structure is begin passed. The DS Objects are encapsulated in an array of length 2 where `index-0` is the data structure and `index-1` is the type of that data structure: `ds_type_list, ds_type_grid, ds_type_map, ds_type_queue, ds_type_stack, ds_type_priority`.

--
#####IF(expression, true-result, false-result)
GameMaker doesn't support the ternary operator which can be a bit of a pain at times when you need simple in-lined if-statements. For example `isalive = (hp > 0)? alive : dead;` will return `alive` if `hp > 0` or `dead` if `hp <= 0` to the variable `isalive` which you normally would have to wrap in an if-statement--e.g. `if (hp > 0) { isalive = alive; } else { isalive = dead; }` which isn't exactly compact and possibly not as readable as it should be. Instead use this script to achieve the same result `isalive = IF(hp > 0, alive, dead);`.

 - Downside: True ternary and if-statements do not evaluate the true/false result unless the expression evaluates to that result. This script however will have everything evaluated before the script is called and then the appropriate result is returned.

--
#####FOREACH(script, params, dispose[false]) & FOR(begin, end, increment, script, params[undefined], dispose[false])
Executes a script over each item in the ds-list(`params`) and passes the current item and ds-list to the script.

 - The `dispose` parameter is for freeing the ds-list from memory after the script call. However if this parameter is left out it'll default to false in turn not freeing the ds-list from memory.
 - The FOR() script has the params as an optional argument, if left out the params will not be passed to the script.

--
#####INTERSECT(x1, y1, x2, y2)
Generally to check if two given ranges intersect you need to check like so: `(x1 >= y1 && x1 <= y2) || (x2 >= y1 && x2 <= y2) || (y1 >= x1 && y1 <= x2) || (y2 >= x1 && y2 <= x2)` which isn't exactly efficient. I found a shorter algorithm for this on [StackOverflow](http://stackoverflow.com/questions/3269434/whats-the-most-efficient-way-to-test-two-integer-ranges-for-overlap) which uses a bit of basic logic to check if the ranges itnersect more efficiently: `x1 <= y2 && y1 <= x2`.
