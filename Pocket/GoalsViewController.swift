//
//  SpendingsTableViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/20/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class GoalViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    let user = User.sharedInstance
    
    @IBOutlet weak var cellName: UITableViewCell!
    
    @IBOutlet var goalsTableView: UITableView!
    
    
    var tableList: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        /*self.tableList.addObject("Clothes")
        self.tableList.addObject("Food")
        self.tableList.addObject("Entertainment")*/
        for (var i = 0; i<user.goals.count;i++){
            var tester = true;
            for (var j = 0; j<tableList.count;j++){
                if (tableList[j] as! NSString == user.goals[i].name){
                    tester = false;
                }
            }
            if (tester){
                if (!user.goals[i].name.isEmpty){
                    self.tableList.addObject("\(user.goals[i].name)")
                }
            }
        }
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        /*for (var i = 0; i<user.expenseCategories.count; i++){
        if (user.expenseCategories[i].isEmpty){
        user.expenseCategories.removeAtIndex(i)
        }
        }*/
    }
    
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //var a = cellName.textLabel?.text
    //user.chosenCategory = a!
    }*/
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("ENTERED")
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")as! UITableViewCell
        
        cell.textLabel?.text = self.tableList.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    // MARK: - Table view data source
    
    
    
    
}



