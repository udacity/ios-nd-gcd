//
//  MainViewController.swift
//  ClosureMemoryLeak
//
//  Created by Jarrod Parkes on 11/10/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - MainViewController: UIViewController

class MainViewController: UIViewController {

    @IBAction func pushLeakyVC(_ sender: Any) {
        navigationController?.pushViewController(LeakyViewController(), animated: true)
    }
    
    @IBAction func pushUnownedVC(_ sender: Any) {
        navigationController?.pushViewController(UnownedViewController(), animated: true)
    }
    
    @IBAction func pushNoCycleVC(_ sender: Any) {
        navigationController?.pushViewController(NoCycleViewController(), animated: true)
    }
}
