//
//  UnownedViewController.swift
//  ClosureMemoryLeak
//
//  Created by Jarrod Parkes on 11/10/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - UnownedViewController: UIViewController

class UnownedViewController: UIViewController {
    
    // MARK: Properties
    
    // NOTE: UnownedViewController references LeakyButton
    let leakyButton = LeakyButton()
    var timesTapped = 0
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure view
        view.backgroundColor = .white
        leakyButton.frame = view.frame
        
        // NOTE: Closure WEAK references UnownedViewController (timesTapped)
        leakyButton.onTapClosure = { [unowned self] in
            self.timesTapped += 1
            print("button tapped \(self.timesTapped) times")
        }
        
        view.addSubview(leakyButton)
    }
    
    deinit {
        print("UnownedViewController deinitialized!")
    }
}

