//
//  SavingsTableViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/21/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class SavingsTableViewController: UITableViewController {

    @IBOutlet var categoriesTableView: UITableView!
    
    let user = User.sharedInstance
    
    var Categories: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*self.tableList.addObject("Clothes")
        self.tableList.addObject("Food")
        self.tableList.addObject("Entertainment")*/
        
        for (var i = 0; i<user.incomeCategories.count; i++){
            var tester = true;
            for (var j = 0; j<Categories.count; j++){
                if (Categories[j] as! NSString == user.incomeCategories[i]){
                    tester = false;
                }
            }
            if (tester){
                var categorySum = 0.00;
                for (var p = 0; p < user.itemList.count; p++){
                    if (user.itemList[p].category == user.incomeCategories[i]){
                        categorySum += user.itemList[p].price
                    }
                }
                if (!user.incomeCategories[i].isEmpty){
                    self.Categories.addObject("\(user.incomeCategories[i]) : $\(categorySum)")
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
        return self.Categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("ENTERED")
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")as! UITableViewCell
        
        cell.textLabel?.text = self.Categories.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
}