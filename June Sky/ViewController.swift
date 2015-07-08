//
//  ViewController.swift
//  June Sky
//
//  Created by Rohan Daruwala on 7/7/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var mediaButton: UIButton!
    @IBOutlet weak var blogButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var coheadsButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func visitWebsiteButton(sender: AnyObject) {
        let url = NSURL(string: "http://www.junesky.org")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    @IBAction func visitFacebookButton(sender: AnyObject) {
        UIApplication.tryURL(["fb://profile/376950672362257", "https://www.facebook.com/juneskyofficial"])
    }
    
    @IBAction func onContactButtonTap(sender: AnyObject) {
        self.performSegueWithIdentifier("contactUsSegue", sender: self)
    }
    
}

