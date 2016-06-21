import UIKit
/*:
# Variable Capture

There's one last thing about functions and closure (we know by now they're the same thing) that we need to know.

It's very easy to understand and even seems very natural, but not all languages have this feature. When you add it to the *first-type* nature of Swift's functions and closures, it tyrns them into super powerful tools!
*/

/*:
## typealias

Before we get started, let's take a look at a concept that will be very useful in our examples of variable capture (actually, the fancy name for this is ```capture of lexical environment```. Feel free to drop this in any casual converstaion if you really want to look like a nerd 😃!).

An **alias** is a simple way of calling something or someone that has a complex or funny name.

For example, say you are a huge, professional wrestler and you want your name to scare the crap out of your opponent. 
Do you seriously think *Terry Jean Bollette* will do? Of course not! That's why he goes by his typealias *Hulk Hogan*.
*/

//: Did you just call me Terry Jean?!
let terry = UIImage(named: "terry.jpg")

/*:
You're just starting your career as a pop singer, but your parents bestowed upon you the aristocratic sounding name of *Florian Cloud de Bounevialle Armstrong*. 

It certainly sounds impressive, but your fans will have a hard time remembering it. 

Better go by the ```typealias``` Dido.
*/
let florian = UIImage(named: "dido.jpg")

/*:
In Swift you can also give new names to existing types, and this is extremely useful when the original name is complex.  

Something like being able to call *Issur Danielovitch Demsky* *Kirk Douglas*. Much better, don't you think so?
*/

/*:
Let's start with something simple. I don't like having to call a Integer an Int. Can we change that? Of course!

Just use the following template:
```typealias NewName = OldName```
*/
typealias Integer = Int

//: Now I can use ```Integer``` instead of ```Int``` whenever I feel like. It's all the same to the compiler!
let z: Integer = 42

/*:
This truly becomes useful when dealing with funky types, such as those of functions (and closures!)

For example, the type of a function that takes an Int and returns another one, would be
```(Int)->Int```

That can be confusing...

Let's call it a ```IntToInt```:
*/
typealias IntToInt = (Int) -> Int

/*:
Now let's create a typealias for a function that takes no parameters (Void) and returns an Int.

I'll call that an ```IntMaker```:
*/
typealias IntMaker = (Void) -> Int

/*:
## Variable capture, at last!

Now we can finally move on to the main course: how functions (and closures) capture variables.

Take a close look at the function ```makeCounter()``` below.  

The code is pretty short, but it will require some close inspection to understand the first time.

*/

// Explain capture with function syntax, as it simpler
func makeCounter() -> IntMaker {
    var n = 0
    
    // Functions within functions?
    // Yes we can!
    func adder() -> Integer {
        n = n + 1
        return n 
    }
    return adder
}

/*:
QUIZ:
What does it return?

### It returns a function

Yes it does, and there's nothing really special about that. Just like some machines create other machines, some functions can create other functions.
*/
let t101 = UIImage(named: "T101.jpg")   // you start by making functions that make functions, then machines that make machines, and then...

/*:
### It contains a function defined within itself!

Yeah, don't panic, that's normal too. Just like you can have machines that contain other machines, and these are only visible from within the containing machine: think of your radio inside your car. No big deal.

It's actually useful to break down a long function by using *inner* functions that do part of the total job.

### adder can *access* the variable *n*!

That's the big deal.

* ```makeCounter``` defines a variable called ```n```, sets it to zero.
* Then, it defines a function called ```adder``` that updates the value of ```n``` and returns it.
* Last but not least, it returns the ```adder``` function.


The real magic is going on inside the ```adder```: **it can access all the variables defined before it!**
Not just n, put also z, which was defined way before. 

It doesn't just *access* n, it actually *modifies* it! And here is where things could go very wrong...

Let's create 2 closures of type ```IntMaker``` by calling twice ```makeCounter``` and save them in two variables as below:
*/

let counter1 = makeCounter()
let counter2 = makeCounter()


/*:
#### Both ```counter1``` and ```counter2``` take no arguments and return an Int.

Think very carefully what the output should be:
QUIZ
*/
counter1()
counter1()
counter1()


/*:
#### And now, for the *grand finale*, what do you think this call will return?

QUIZ
Explain why you think it will return the value you expect
*/
counter2()

/*:
### Safe capture

The bottom line is that every time an ```adder``` is created, it takes a copy of all captured variables. Therefore, each closure has its own copy of the environment (the values of all variables that were captured).

This is done for safety and to keep you sane: the value of a variable will never change out of the blue, because, somewhere some closure decided to chnage it.  Everybody has it's own copy.
*/

/*:
## Wrapping up!

We've learned quite a few things about Swift in this lesson, so let's recap:

* Functions and closures are the same thing. We just have 2 different sintaxes to express one same thing.
* Functions and closures are first-class citizens of our language: we can treat them like any other type.
* Functions and closure capture variables defined before the closure or function is defined.

It might not seem obvious to you at this point, but those 2 last features make Swift a far more powerful language. They are the base of a different style of programming called *Functional Programming*.

Its popularity is increasing a lot lately. However, you won't need it to finish the Nanodegree program or even land your first job, so don't worry, it's something that you can learn later if you want.

If you are interested, you might want to read any of these books:

* [To Mock a Mockingbird](http://www.amazon.com/To-Mock-Mockingbird-Other-Puzzles/dp/0192801422) by Raymond Smullyan: a gentle introduction to Functional Programming using birds as an analogy.
* [Functional Programming in Swift](https://www.objc.io/books/fpinswift/) by Chris Eidhof and Florian Kugler. This book assumes you already know Swift and teaches you how to use in a functional way.

## On to Grand Central Dispatch

In the meantime, we'll move to the next chapter which deals with *Grand Central Dispatch* (GCD). This is a library that allows us to create background tasks wiht great ease. This is vital to ship great Apps and avoid being rejected from the App Store. 

Our newly gained knowledge of closures will make understanding GCD a breeze, so let's move on and learn it! 😉
*/
