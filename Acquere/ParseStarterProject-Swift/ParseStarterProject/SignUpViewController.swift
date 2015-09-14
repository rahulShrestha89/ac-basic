//
//  SignUpViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 9/12/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import TwitterKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var facebookSignUpButton: UIButton!
    @IBOutlet weak var twitterSignUpButton: UIButton!
    
    @IBOutlet weak var linkedInSignUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.navigationBar.hidden=false
        
        facebookSignUpButton.layer.cornerRadius = 7
        facebookSignUpButton.backgroundColor = UIColor.clearColor()
        facebookSignUpButton.layer.borderColor = UIColor(red: 0.231, green: 0.349, blue: 0.596, alpha: 1.0).CGColor
        facebookSignUpButton.layer.borderWidth = 2
        facebookSignUpButton.setTitleColor(UIColor(red: 0.231, green: 0.349, blue: 0.596, alpha: 1.0), forState: UIControlState.Normal)
    
        twitterSignUpButton.layer.cornerRadius = 7
        twitterSignUpButton.backgroundColor = UIColor.clearColor()
        twitterSignUpButton.layer.borderColor = UIColor(red: 0.333, green: 0.675, blue: 0.933, alpha: 1).CGColor
        twitterSignUpButton.layer.borderWidth = 2
        twitterSignUpButton.setTitleColor(UIColor(red: 0.333, green: 0.675, blue: 0.933, alpha: 1), forState: UIControlState.Normal)
    
        linkedInSignUpButton.layer.cornerRadius = 7
        linkedInSignUpButton.backgroundColor = UIColor.clearColor()
        linkedInSignUpButton.layer.borderColor = UIColor(red: 0, green: 0.467, blue: 0.71, alpha: 1).CGColor
        linkedInSignUpButton.layer.borderWidth = 2
        linkedInSignUpButton.setTitleColor(UIColor(red: 0, green: 0.467, blue: 0.71, alpha: 1), forState: UIControlState.Normal)
    }
   
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.hidden=false
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
