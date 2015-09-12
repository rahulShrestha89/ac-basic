/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var lookAroundButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // UI changes to Sign Up Button
        signUpButton.layer.cornerRadius = 12
        signUpButton.backgroundColor = UIColor(red: 1, green: 0.541, blue: 0.396, alpha: 1.0)
        signUpButton.layer.borderColor = UIColor.clearColor().CGColor
        
        // working out the horizontal and vertical lines
        var bounds = UIScreen.mainScreen().bounds
        var width = bounds.size.width
        var height = bounds.size.height
        
        let horizontalLine : CGRect = CGRectMake(0, height-45, width, 1)
        let verticalLine : CGRect = CGRectMake(width/2, height-45, 1, height)
        
        let horizontalLineView = UIView(frame: horizontalLine)
        let verticalLineView = UIView(frame: verticalLine)
        
        horizontalLineView.backgroundColor = UIColor.whiteColor()
        verticalLineView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(horizontalLineView)
        self.view.addSubview(verticalLineView)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
