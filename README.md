<img src="https://s3-us-west-1.amazonaws.com/udacity-content/degrees/catalog-images/nd003.png" alt="iOS Developer Nanodegree logo" height="70" >

# Grand Central Dispatch

![Platform iOS](https://img.shields.io/badge/nanodegree-iOS-blue.svg)

This repository contains resources for Udacity's Grand Central Dispatch course.

## Overview

There are two parts to this repo: (1) the playgrounds about closures and (2) the FatImages projects. The FatImages projects are separated into the following steps:

### Step 1

Add basic scaffolding with stub implementation of the three main methods:

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

### Step 2

Add synchronous example, line by line.

### Step 2.1

Same as aboved, but compacted into a neat and safe if-let construct.

### Step 3

Add simple asynchronous method.

### Step 4

Add asynchronous code running the completion closure in the background. Eventually this will crash. Explain why completion handlers should go in the main queue.

### Step 4.1

Add asyncronous code that runs the completion block in the main queue. Now we're good.

### Step 5

Provide user feedback with an activity indicator. It works everywhere except the synchronous method. Why? Enter the runloop and how to delay a task with GCD.

### Step 5.1

Fix the synchronous method with dispatch_after()

## Setup

Generally speaking, the projects can run without any additional setup. However, consult the Grand Central Dispatch course for more information.

## Maintainers

@frr149
