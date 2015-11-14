//
//  UserInfoViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 11/14/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class UserInfoViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var showRealName: UILabel!
    @IBOutlet weak var numberOfFollowers: UILabel!
    @IBOutlet weak var followingNumber: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var showUsername: UIButton!
    var currentUser = PFUser.currentUser()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateButton(showRealName, color: UIColor(red: 0.506, green: 0.831, blue: 0.98, alpha: 1))
        
        showRealName.text = " "+(currentUser!["firstName"] as? String)! + " " +
            (currentUser!["lastName"] as? String)!+"  "
    }

    @IBAction func goBack(sender: AnyObject) {
        self.performSegueWithIdentifier("backToTabbedViewFromUserInfo", sender: self)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        userProfileImage.image = image
        
        let imageData = UIImagePNGRepresentation(userProfileImage.image!)
        
        var imageGUID = NSUUID().UUIDString + (PFUser.currentUser()?.objectId)! as String + (PFUser.currentUser()?.username)! as String + ".jpg"
        
        let imageFile = PFFile(name: imageGUID, data: imageData!)
        
        currentUser!["profileImage"] = imageFile

        currentUser?.saveInBackgroundWithBlock{(success,error) -> Void in
            
            if error==nil{
                print("Image saved successfully as " + imageGUID)
            } else {
                print("Problem with Image file size!!!!")
            }
        }
    }
 
    @IBAction func changeImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    private func decorateButton(label: UILabel, color: UIColor) {
        
        label.layer.borderColor = color.CGColor
        label.backgroundColor = color
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 7
    }

}
