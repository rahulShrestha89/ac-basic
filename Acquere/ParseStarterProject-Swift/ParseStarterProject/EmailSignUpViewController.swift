//
//  EmailSignUpViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 9/18/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import SwiftValidator


class EmailSignUpViewController: UIViewController{
    @IBOutlet weak var signUpButton: UIButton!

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let validator = Validator()
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
        
        let passwordString:String = passwordTextField.text
        let passwordCount = count(passwordString)
        
        if firstNameTextField.text=="" || lastNameTextField.text=="" || emailAddressTextField.text=="" || passwordTextField.text=="" || confirmPasswordTextField.text==""{
            var blankFieldAlert = UIAlertController(title: "Empty Form Field Error", message: "All the Entries are required.", preferredStyle: UIAlertControllerStyle.Alert)
            blankFieldAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(blankFieldAlert, animated: true, completion: nil);
        } else if !isValidEmail(emailAddressTextField.text){
            var emailErrorAlert = UIAlertController(title: "Incorrect Email Format", message: "Please Enter a Valid Email Address.", preferredStyle: UIAlertControllerStyle.Alert)
            emailErrorAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(emailErrorAlert, animated: true, completion: nil);
        } else if passwordCount < 6 {
            var passwordLengthErrorAlert = UIAlertController(title: "Weak Password", message: "Password must be greater than 5 characters. Try Again?", preferredStyle: UIAlertControllerStyle.Alert)
            passwordLengthErrorAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(passwordLengthErrorAlert, animated: true, completion: nil);
        } else if passwordTextField.text != confirmPasswordTextField.text{
            var passwordErrorAlert = UIAlertController(title: "Incorrect Password Combination", message: "Passwords do not match. Try Again?", preferredStyle: UIAlertControllerStyle.Alert)
            passwordErrorAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(passwordErrorAlert, animated: true, completion: nil);
        }
        
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = testStr.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
        let result = range != nil ? true : false
        return result
        
    }
    
    
}
