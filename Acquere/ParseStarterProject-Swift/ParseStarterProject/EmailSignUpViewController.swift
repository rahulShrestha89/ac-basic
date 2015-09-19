//
//  EmailSignUpViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 9/18/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit


class EmailSignUpViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!

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
    
}
