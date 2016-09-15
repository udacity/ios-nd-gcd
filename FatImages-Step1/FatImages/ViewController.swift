//
//  ViewController.swift
//  FatImages
//
//  Created by Fernando Rodriguez on 10/12/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - BigImages: String

// Wondering why we only use https connections?
// It's because of a new iOS feature called App Transport Security.
// From now on, Apps can only access resources through a secure
// connection, using https. You can easily change this default
// behavior. Check this article to find out how:
// http://www.neglectedpotential.com/2015/06/working-with-apples-application-transport-security/
// OTOH, if you have no idea what the difference between an http and
// https connection is, fear not! Everything will be explained in the
// networking section.
// At this point it's not relevant.
enum BigImages: String {
    case whale = "https://lh3.googleusercontent.com/16zRJrj3ae3G4kCDO9CeTHj_dyhCvQsUDU0VF0nZqHPGueg9A9ykdXTc6ds0TkgoE1eaNW-SLKlVrwDDZPE=s0#w=4800&h=3567"
    case shark = "https://lh3.googleusercontent.com/BCoVLCGTcWErtKbD9Nx7vNKlQ0R3RDsBpOa8iA70mGW2XcC76jKS09pDX_Rad6rjyXQCxngEYi3Sy3uJgd99=s0#w=4713&h=3846"
    case seaLion = "https://lh3.googleusercontent.com/ibcT9pm_NEdh9jDiKnq0NGuV2yrl5UkVxu-7LbhMjnzhD84mC6hfaNlb-Ht0phXKH4TtLxi12zheyNEezA=s0#w=4626&h=3701"
}

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var photoView: UIImageView!
    
    // MARK: Actions
    
    // This method downloads a huge image, blocking the main queue and
    // the UI.
    // This si for instructional purposes only, never do this.
    @IBAction func synchronousDownload(_ sender: UIBarButtonItem) {
        
    }
    
    // This method avoids blocking by creating a new queue that runs
    // in the background, without blocking the UI.
    @IBAction func simpleAsynchronousDownload(_ sender: UIBarButtonItem) {

    }
    
    // This code downloads the huge image in a global queue and uses a completion
    // closure.
    @IBAction func asynchronousDownload(_ sender: UIBarButtonItem) {

    }
    
    // Changes the alpha value (transparency of the image). It's only purpose is to show if the
    // UI is blocked or not.
    @IBAction func setTransparencyOfImage(_ sender: UISlider) {
        photoView.alpha = CGFloat(sender.value)
    }
}
