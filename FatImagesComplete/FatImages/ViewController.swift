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
    @IBOutlet weak var activityView: UIActivityIndicatorView!

    // MARK: Actions
    
    // This method downloads a huge image, blocking the main queue and
    // the UI.
    // This si for instructional purposes only, never do this.
    @IBAction func synchronousDownload(_ sender: UIBarButtonItem) {
        
        // hide current image
        photoView.image = nil
        
        // start animation
        activityView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(1) / Double(NSEC_PER_SEC)) { () -> Void in
            // Get the URL for the image
            // Obtain the NSData with the image
            // Turn it into a UIImage
            if let url = URL(string: BigImages.seaLion.rawValue),
                let imgData = try? Data(contentsOf: url),
                let image = UIImage(data: imgData) {
                    
                    // Display it
                    self.photoView.image = image
                    
                    // Stop animating
                    self.activityView.stopAnimating()
            }
        }
    }
    
    // This method avoids blocking by creating a new queue that runs
    // in the background, without blocking the UI.
    @IBAction func simpleAsynchronousDownload(_ sender: UIBarButtonItem) {
        
        // hide current image
        photoView.image = nil
        
        // start animation
        activityView.startAnimating()
        
        // Get the URL for the image
        let url = URL(string: BigImages.shark.rawValue)
        
        // create a queue
        let downloadQueue = DispatchQueue(label: "download", attributes: [])
        
        // add a closure that encapsulates the blocking operation
        // run it asynchronously: some time in the near future
        downloadQueue.async { () -> Void in
            // Obtain the NSData with the image
            let imgData = try? Data(contentsOf: url!)
            
            // Turn it into a UIImage
            let image = UIImage(data: imgData!)
            
            // Run the code that updates the UI in the main queue!  
            DispatchQueue.main.async(execute: { () -> Void in
                // Display it
                self.photoView.image = image
                
                // Stop animating
                self.activityView.stopAnimating()
            })
        }
    }
    
    // This code downloads the huge image in a global queue and uses a completion
    // closure.
    @IBAction func asynchronousDownload(_ sender: UIBarButtonItem) {
        
        // hide current image
        photoView.image = nil
        
        // start animation
        activityView.startAnimating()
        
        withBigImage { (image) -> Void in
            // Display it
            self.photoView.image = image
            
            // Stop animating
            self.activityView.stopAnimating()
        }
    }
    
    // Changes the alpha value (transparency of the image). It's only purpose is to show if the
    // UI is blocked or not.
    @IBAction func setTransparencyOfImage(_ sender: UISlider) {
        photoView.alpha = CGFloat(sender.value)
    }
    
    // MARK: Download Big Image
    
    // This method downloads and image in the background once it's
    // finished, it runs the closure it receives as a parameter.
    // This closure is called a completion handler
    // Go download the image, and once you're done, do _this_ (the completion handler)
    func withBigImage(completionHandler handler: @escaping (_ image: UIImage) -> Void){
        
        DispatchQueue.global(qos: .userInitiated).async { () -> Void in
            
            // get the url
            // get the NSData
            // turn it into a UIImage
            if let url = URL(string: BigImages.whale.rawValue), let imgData = try? Data(contentsOf: url), let img = UIImage(data: imgData) {
                // run the completion block
                // always in the main queue, just in case!
                DispatchQueue.main.async(execute: { () -> Void in
                    handler(img)
                })
            }
        }
    }
}
