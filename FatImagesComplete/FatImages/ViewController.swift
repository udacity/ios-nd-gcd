//
//  ViewController.swift
//  FatImages
//
//  Created by Fernando Rodriguez on 10/12/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - BigImages: String

enum BigImages: String {
    case whale = "https://d17h27t6h515a5.cloudfront.net/topher/2017/November/59fe5127_whale/whale.jpg"
    case shark = "https://d17h27t6h515a5.cloudfront.net/topher/2017/November/59fe5123_shark/shark.jpg"
    case seaLion = "https://d17h27t6h515a5.cloudfront.net/topher/2017/November/59fe511f_sealion/sealion.jpg"
}

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!

    // MARK: Actions
    
    // this method downloads a huge image, blocking the main queue and the UI
    // (for instructional purposes only, never do this in a production app)
    @IBAction func synchronousDownload(sender: UIBarButtonItem) {
        // start animation
        activityView.startAnimating()
                
        // use url to get the data for the image
        if let url = URL(string: BigImages.seaLion.rawValue), let imgData = try? Data(contentsOf: url) {
            // turn data into an image
            let image = UIImage(data: imgData)
            
            // display it
            self.photoView.image = image
            
            // stop animating
            self.activityView.stopAnimating()
        }
    }
    
    // this method avoids blocking by creating a background queue, without blocking the UI
    @IBAction func simpleAsynchronousDownload(sender: UIBarButtonItem) {
        // start animation
        activityView.startAnimating()
        
        // create a queue
        let downloadQueue = DispatchQueue(label: "download", qos: .userInitiated)
        
        // run the blocking operation in the background
        downloadQueue.async {
            // use url to get the data for the image
            if let url = URL(string: BigImages.shark.rawValue), let imgData = try? Data(contentsOf: url) {
                // turn data into an image
                let image = UIImage(data: imgData)
                
                // run  code that updates the UI on the main queue
                DispatchQueue.main.async {
                    // display it
                    self.photoView.image = image
                    
                    // stop animating
                    self.activityView.stopAnimating()
                }
            }
        }
    }
    
    // download the huge image on a global queue and uses a completion handler (closure)
    @IBAction func asynchronousDownload(sender: UIBarButtonItem) {
        // start animation
        activityView.startAnimating()
        
        withBigImage { (image) -> Void in
            // display it
            self.photoView.image = image
            
            // stop animating
            self.activityView.stopAnimating()
        }
    }
    
    // changes the transparency of the image (to show if the UI is blocked or not)
    @IBAction func setTransparencyOfImage(sender: UISlider) {
        photoView.alpha = CGFloat(sender.value)
    }
    
    // MARK: Completion Handler
    
    // this method downloads the image in the background
    // once finished, the completion closure runs with the image
    func withBigImage(completionHandler handler: @escaping (UIImage?) -> Void){
        DispatchQueue.global(qos: .userInitiated).async {
            // use url to get the data for the image
            if let url = URL(string: BigImages.whale.rawValue), let imgData = try? Data(contentsOf: url) {
                // turn data into an image
                let image = UIImage(data: imgData)
                
                // always run completion handler in the main queue, just in case!
                DispatchQueue.main.async {
                    handler(image)
                }
            }
        }
    }
}
