/*:
# What does it mean for a Closure to be a first class citizen of the language?
*/

/*:
It means you can use them just like any other type, such as Ints, Floats, String, etc.
You can 
* assign them to variables or constants, 
* put then inside arrays or dictionaries,
* return them as the result of a function or closure 
* and even receive them as parameters of another function or closure!

That last part seems a bit weird, so let's start with the most obvious parts.
*/

import UIKit

//: Assign to a var or constant
let f = { (x:Int) -> Int in
    return x + 42
}

/*: 
Closures have types too! Look at the *results sidebar* on the right side, and you'll
see that the type of the closure above is ```Int -> Int```: it takes an ```Int``` and returns an ```Int```.

*/

f(0)
f(1)
f(99)

/*:
You can call the closure you saved in the constant *f* in the normal way.
*/

f(89)

/*:
However, try to call it passing a String as a parameter: ```f("foo")```.
What happens? Why?
*/

/*:
Now let's try something fancier! Let's put a bunch of closures inside an array
*/

let closures = [
    f,                                  // our previous closure
    {(x:Int) -> Int in return x * 2},   // a new Int -> Int closure
    {x in return x - 8},                // no need for the type of the closure!
    {x in x * x},                       // no need for return if only one line
    {$0 * 42}                           // access parameter by position instead of name
]

/*:
Can we still call those closures stored in the dictionary?
*YES!*
*/

for fn in closures {
    fn(42)
}

/*:
EXERCISE: Create an array with two closures, one that takes 2 integers and returns the sum as
another integer, and one that takes two floats and returns the sum as a float.
Will it compile? Why?
*/

/*:
## Closures as result values and parameters!

This last part is not really necessary, but if you're interested, we'll explain it in the next Playground.

*/

