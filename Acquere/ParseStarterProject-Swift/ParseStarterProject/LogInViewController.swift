//
//  LogInViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 9/12/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var linkedInLogInButton: UIButton!
   @IBOutlet weak var facebookLogInButton: UIButton!
    @IBOutlet weak var twitterLogInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.hidden=false
        
    
        decorateButton(facebookLogInButton,color: UIColor(red: 0.231, green: 0.349, blue: 0.596, alpha: 1.0) )
         decorateButton(twitterLogInButton, color: UIColor(red: 0.333, green: 0.675, blue: 0.933, alpha: 1))
         decorateButton(linkedInLogInButton, color: UIColor(red: 0, green: 0.467, blue: 0.71, alpha: 1))
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.hidden=false
    }

    
    private func decorateButton(button: UIButton, color: UIColor) {
        
        button.setTitleColor(color, forState: UIControlState.Normal)
        button.layer.borderColor = color.CGColor
        button.backgroundColor = UIColor.clearColor()
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 7
    }
    
    


}
