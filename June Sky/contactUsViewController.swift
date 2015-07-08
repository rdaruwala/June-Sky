//
//  contactUsViewController.swift
//  June Sky
//
//  Created by Rohan Daruwala on 7/7/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit
import MessageUI

class contactUsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextView!
    @IBOutlet weak var inputViewButtonConstraint: NSLayoutConstraint!
    
    var mc: MFMailComposeViewController!
    
    var stuffArray:[AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.backgroundColor = UIColor.clearColor()
        submitButton.layer.cornerRadius = 10
        submitButton.layer.borderWidth = 3
        submitButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        messageTextField.clipsToBounds = true
        messageTextField.layer.cornerRadius = 10.0
        
        mc = MFMailComposeViewController()
        
        stuffArray = [nameTextField, subjectTextField, messageTextField]
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height {
                inputViewButtonConstraint.constant = keyboardHeight + 8
                UIView.animateWithDuration(0.15, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        inputViewButtonConstraint.constant = 0
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmitButtonTap(sender: AnyObject) {
        messageTextField.resignFirstResponder()
        if(nameTextField.text != nil && nameTextField.text != "" && subjectTextField.text != nil && subjectTextField.text != "" && messageTextField.text != nil && messageTextField.text != ""){
            
            let emailTitle = "From " + nameTextField.text! + ": " + subjectTextField.text!
            let messageBody = messageTextField.text!
            let toRecipents = ["admin@junesky.org"]
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients(toRecipents)
            
            self.presentViewController(mc, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
            self.performSegueWithIdentifier("toHomeFromContactSegue", sender: self)
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
            self.performSegueWithIdentifier("toHomeFromContactSegue", sender: self)
        case MFMailComposeResultFailed.rawValue:
            print("Mail sent failure: %@", [error!.localizedDescription])
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onAreaTap(sender: UITapGestureRecognizer) {
        
        for object in stuffArray{
            if (object.frame.contains(sender.locationInView(self.view))) == false{
                messageTextField.resignFirstResponder()
                nameTextField.resignFirstResponder()
                subjectTextField.resignFirstResponder()
            }
            
        }
        
    }
    
    
    
}
