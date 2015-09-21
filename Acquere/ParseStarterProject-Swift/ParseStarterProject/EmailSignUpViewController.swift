//
//  EmailSignUpViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 9/18/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import SwiftValidator


class EmailSignUpViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
         decorateButton(signUpButton, color: UIColor(red: 0.114, green: 0.914, blue: 0.714, alpha: 1))
        
    }
    
    private func decorateButton(button: UIButton, color: UIColor) {
        
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.layer.borderColor = color.CGColor
        button.backgroundColor = color
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 7
    }
    
    @IBAction func signUpButtonTapped(sender: AnyObject) {
        let validator = Validator()
        
        
        if firstName.text=="" || lastName.text=="" || emailAddress.text=="" || password.text=="" || confirmPassword.text==""{
            var blankFieldAlert = UIAlertController(title: "Form Error", message: "All the Entries are required.", preferredStyle: UIAlertControllerStyle.Alert)
            blankFieldAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(blankFieldAlert, animated: true, completion: nil)
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = testStr.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
        let result = range != nil ? true : false
        return result
        
    }
}
