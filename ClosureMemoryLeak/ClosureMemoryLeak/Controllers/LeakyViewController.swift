//
//  LeakyViewController.swift
//  ClosureMemoryLeak
//
//  Created by Jarrod Parkes on 11/10/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - LeakyViewController: UIViewController

class LeakyViewController: UIViewController {
    
    // MARK: Properties
    
    // NOTE: LeakyViewController references LeakyButton
    let leakyButton = LeakyButton()
    var timesTapped = 0
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure view
        view.backgroundColor = .white
        leakyButton.frame = view.frame
        
        // NOTE: Closure references LeakyViewController (timesTapped)
        leakyButton.onTapClosure = {
            self.timesTapped += 1
            print("button tapped \(self.timesTapped) times")
        }
        
        view.addSubview(leakyButton)
    }
    
    deinit {
        print("LeakyViewController deinitialized!")
    }
}
