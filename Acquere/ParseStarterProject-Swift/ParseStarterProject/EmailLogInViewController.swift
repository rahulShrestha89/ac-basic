//
//  EmailLogInViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 9/24/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class EmailLogInViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateButton(logInButton, color: UIColor(red: 0.259, green: 0.647, blue: 0.961, alpha: 1))
    }

    private func decorateButton(button: UIButton, color: UIColor) {
        
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.layer.borderColor = color.CGColor
        button.backgroundColor = color
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 7
    }

    @IBAction func logInButtonTapped(sender: AnyObject) {
        
        let passwordString:String = passwordTextField.text
        let passwordCount = count(passwordString)
        
        var currentUser = PFUser.currentUser()
        
        if self.emailAddressTextField.text=="" || self.passwordTextField.text==""  {
            var blankFieldAlert = UIAlertController(title: "Empty Form Field Error", message: "All the Entries are required.", preferredStyle: UIAlertControllerStyle.Alert)
            blankFieldAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(blankFieldAlert, animated: true, completion: nil);
        }
        else if !isValidEmail(emailAddressTextField.text){
            var emailErrorAlert = UIAlertController(title: "Incorrect Email Format", message: "Please Enter a Valid Email Address.", preferredStyle: UIAlertControllerStyle.Alert)
            emailErrorAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(emailErrorAlert, animated: true, completion: nil);
        }
        else if passwordCount < 6 {
            var passwordLengthErrorAlert = UIAlertController(title: "Short Password", message: "Your Password was more than 5 characters.", preferredStyle: UIAlertControllerStyle.Alert)
            passwordLengthErrorAlert.addAction(UIAlertAction(title: "Gotcha!", style: .Default, handler: nil))
            self.presentViewController(passwordLengthErrorAlert, animated: true, completion: nil);
        }
        else {
            PFUser.logInWithUsernameInBackground(emailAddressTextField.text, password:passwordTextField.text) {
                (user: PFUser?, error: NSError?) -> Void in
               
                if error != nil{
                    var combo = UIAlertController(title: "Combo", message: "Email and Pass Combo problem.", preferredStyle: UIAlertControllerStyle.Alert)
                    combo.addAction(UIAlertAction(title: "Gotcha!", style: .Default, handler: nil))
                    self.presentViewController(combo, animated: true, completion: nil);
                }
                 else if user!["emailVerified"] as! Bool == false {
                    var loginFail = UIAlertController(title: "LogIn Fail", message: "Something wrong with email verification.", preferredStyle: UIAlertControllerStyle.Alert)
                    loginFail.addAction(UIAlertAction(title: "Gotcha!", style: .Default, handler: nil))
                    self.presentViewController(loginFail, animated: true, completion: nil);
                }else{
                    var loginSuccess = UIAlertController(title: "LogIn YEEEE", message: "all good!!", preferredStyle: UIAlertControllerStyle.Alert)
                    loginSuccess.addAction(UIAlertAction(title: "Gotcha!", style: .Default, handler: nil))
                    self.presentViewController(loginSuccess, animated: true, completion: nil);
                }
            }
        }
       
    }
    
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = testStr.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
        let result = range != nil ? true : false
        return result
        
    }
}
