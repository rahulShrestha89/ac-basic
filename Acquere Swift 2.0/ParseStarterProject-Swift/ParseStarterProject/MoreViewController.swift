//
//  MoreViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Rahul Shrestha on 11/5/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    // provides the number of section header titles
    let headerTitlesForSection = ["User", "Settings"]
    let rowData = [["User Name"], ["Privacy Settings", "Info Settings", "Notification Settings"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource=self
        self.tableView.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // provide the number of section to the table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headerTitlesForSection.count
    }

    // provide the number of rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowData[section].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitlesForSection.count {
            return headerTitlesForSection[section]
        }
        
        return nil
    }
    
    // provide data for each section
    //checks to see there's a title for that section and returns it, otherwise nil is returned. There won't be a title if the number of titles in headerTitlesForSection is smaller than the number of arrays in rowData
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        cell.textLabel?.text = rowData[indexPath.section][indexPath.row]
        
        return cell
    }

}
