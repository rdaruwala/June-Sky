//
//  webViewController.swift
//  June Sky
//
//  Created by Rohan Daruwala on 7/18/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit

class webViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var URLRecieved:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        let URL = NSURL(string: URLRecieved)
        let request = NSURLRequest(URL: URL!)
        webView.loadRequest(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDoneButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
