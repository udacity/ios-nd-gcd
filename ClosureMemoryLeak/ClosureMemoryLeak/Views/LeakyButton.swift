//
//  LeakyButton.swift
//  ClosureMemoryLeak
//
//  Created by Jarrod Parkes on 11/10/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - LeakyButton: UIButton

class LeakyButton: UIButton {
    
    // MARK: Properties
    
    var numbers = [Double](repeating: 0.0, count: Constants.sizableCount)
    
    // NOTE: LeakyButton references Closure
    var onTapClosure: (() -> Void)?
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        setTitle("Press Me", for: .normal)
        setTitleColor(tintColor, for: .normal)
        addTarget(self, action: #selector(onTapFunction), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
    @objc func onTapFunction() {
        onTapClosure?()
    }
}
