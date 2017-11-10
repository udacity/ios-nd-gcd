//
//  NoCycleViewController.swift
//  ClosureMemoryLeak
//
//  Created by Jarrod Parkes on 11/10/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - NoCycleViewController: UIViewController

class NoCycleViewController: UIViewController {
    
    // MARK: Properties
    
    // NOTE: NoCycleViewController references LeakyButton
    let leakyButton = LeakyButton()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure view
        view.backgroundColor = .white        
        leakyButton.frame = view.frame
        
        // NOTE: Closure doesn't need to reference NoCycleViewController; cycle broken!
        var timesTapped = 0
        leakyButton.onTapClosure = {
            timesTapped += 1
            print("button tapped \(timesTapped) times")
        }
        
        view.addSubview(leakyButton)
    }
    
    deinit {
        print("NoCycleViewController deinitialized!")
    }
}
