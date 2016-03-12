//
//  ProjectsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 11/17/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class ProjectsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let projectsQuery = PFQuery(className:"SharedProjects")
        if let user = PFUser.currentUser() {
            projectsQuery.whereKey("userId", equalTo: user.objectId!)
        }
        
        projectsQuery.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) projects.")
                
                for object in objects! {
                    if let allProjects = object as? PFObject! {
                        
                         print(object.objectId)
                    }
                }
               
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    @IBAction func onDoneButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("backToTabbedViewFromProjects", sender: nil)
    }
   
   
}
