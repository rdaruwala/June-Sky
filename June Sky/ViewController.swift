//
//  ViewController.swift
//  June Sky
//
//  Created by Rohan Daruwala on 7/7/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toTransmitURL = ""
    
    @IBOutlet weak var ourWorkButton: UIButton!
    @IBOutlet weak var mediaButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onContactButtonTap(sender: AnyObject) {
        self.performSegueWithIdentifier("contactUsSegue", sender: self)
    }
    
    
    @IBAction func onWorkButtonTap(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Select Tab", message: "Please select which section you would like to view.", preferredStyle: .ActionSheet)
        let blogAction = UIAlertAction(title: "Blog" , style: .Default){ (action) -> Void in
            self.toTransmitURL = "http://junesky.org/blog/"
            self.performSegueWithIdentifier("toWebView", sender: self)
        }
        let projectAction = UIAlertAction(title: "Projects", style: .Default, handler: { (action) -> Void in
            self.toTransmitURL = "http://junesky.org/projects/"
            self.performSegueWithIdentifier("toWebView", sender: self)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheet.addAction(blogAction)
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(projectAction)
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func onMediaButtonTap(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Select Tab", message: "Please select which section you would like to view.", preferredStyle: .ActionSheet)
        let FBAction = UIAlertAction(title: "Facebook Page" , style: .Default){ (action) -> Void in
            UIApplication.tryURL(["fb://profile/376950672362257", "https://www.facebook.com/juneskyofficial"])
        }
        let WebsiteAction = UIAlertAction(title: "Our Website", style: .Default, handler: { (action) -> Void in
            let url = NSURL(string: "http://www.junesky.org")
            UIApplication.sharedApplication().openURL(url!)
        })
        let YTAction = UIAlertAction(title: "Our Youtube Channel", style: .Default, handler: { (action) -> Void in
            UIApplication.tryURL(["youtube://channel/UCm2B71fET1IXzHd-kROb_nw", "https://www.youtube.com/channel/UCm2B71fET1IXzHd-kROb_nw"])
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheet.addAction(FBAction)
        actionSheet.addAction(WebsiteAction)
        actionSheet.addAction(YTAction)
        actionSheet.addAction(cancelAction)
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    @IBAction func onAboutTap(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Select Tab", message: "Please select which section you would like to view.", preferredStyle: .ActionSheet)
        let OrgAction = UIAlertAction(title: "About the Organization" , style: .Default){ (action) -> Void in
            self.toTransmitURL = "http://junesky.org/about-the-organization/"
            self.performSegueWithIdentifier("toWebView", sender: self)
        }
        let WebsiteAction = UIAlertAction(title: "Co-Heads", style: .Default, handler: { (action) -> Void in
            self.toTransmitURL = "http://junesky.org/co-heads-of-the-group/"
            self.performSegueWithIdentifier("toWebView", sender: self)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheet.addAction(OrgAction)
        actionSheet.addAction(WebsiteAction)
        actionSheet.addAction(cancelAction)
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toWebView"){
            let next = segue.destinationViewController as? UINavigationController
            let vc = next?.topViewController as? webViewController
            vc!.URLRecieved = toTransmitURL
        }
    }
    
    
}

