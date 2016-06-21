/*:
# Closures & Functions: same old, same old...
*/
import UIKit

/*:
## Functions and closures are the same thing

So far, it looks like a closure is a function with some extra features and a slightly different syntax. 

*Not so, little grasshopper!*

Functions and Closures are exactly the same thing, they just have a different syntax! Therefore, all the 'extras' that Closures pack, are also available to functions.

**Closures and functions are just alter egos, like Peter Parker and Spiderman.**
*/
let alterego = UIImage(named: "peterSpiderman.jpg")

/*:
The function and closure below are exactly equivalent. They don't just do the same thing (check them out!), they *are* the same thing.
*/
func foo(x:Int) -> Int {
    return 42 + x
}

let bar = { (x: Int) -> Int in
    return 42 + x
}

/*:
Actually, when the compiler finds a function declaration such as ```foo```, it will take the following steps:

* Create a closure that takes an Int and returns 42 plus that Int.
* Then, assigns this closure to a constant called ```foo```

Sounds familiar? Yep, that's exactly what you did for bar!
*/


/*:
### Bottom Line

Since functions and closures are the same thing, use whatever syntax makes more sense at a given time.
*/


/*:
### Can we add functions to a collection (such as an Array) as we just did with closures in the previous playground!

**Soitenly!**

It **is** the same thing!
*/
let soitenly = UIImage(named: "soitenly.jpg")

// add a few functions to an array and then call them
func larry(x:Int) -> Int {
    return x * x
}

func curly(n:Int) -> Int {
    return n * (n - 1)
}

func moe(n:Int) -> Int {
    return n * (n - 1) * (n - 2)
}

var stooges = [larry, curly, moe]

for stooge in stooges {
    stooge(42)
}

/*:
Could we add the ```bar``` closure to ```stooges```?

YES!, they have the same type and it doesn't matter if they where defined using the closure syntax or the function one.

*/

stooges.append(bar)
for each in stooges {
    each(42)
}

/*:
Could we add the function ```baz``` below to ```stooges```?

Explain why

*/
func baz(x: Int) -> Double {
    return Double(x) / 42
}

