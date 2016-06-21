#GCD Example: Fat Images

## Step 1

Basic scaffolding with stub implementation of the three main methods:

```
    // This method downloads a huge image, blocking the main queue and
    // the UI.
    // This si for instructional purposes only, never do this.
    @IBAction func synchronousDownload(sender: UIBarButtonItem) {
    }
    
    // This method avoids blocking by creating a new queue that runs
    // in the background, without blocking the UI.
    @IBAction func simpleAsynchronousDownload(sender: UIBarButtonItem) {
    }
    
    // This code downloads the huge image in a global queue and uses a completion
    // closure.
    @IBAction func asynchronousDownload(sender: UIBarButtonItem) {
    }
```

##Step 2

Synchronous code, line by line, filled with !.


##Step 2.1

Same as aboved, but in a neat and safe if let construct.

##Step 3

Simple asynchronous method.

##Step 4

Asynchronous code running the completion closure in the background. Eventually this will crash. Explain why completion handlers should go in the main queue.

##Step 4.1

Asyncronous code that runs the completion block in the main queue. Now we're good.

##Step 5

Provide user feedback with an activity indicator. It works everywhere except the synchronous method. Why? Enter the RunLoop and how to delay a task with GCD.

##Step 5.1

Fix the synchronous method with dispatch_after()
