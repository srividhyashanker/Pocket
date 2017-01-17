//
//  SpendingsTableViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/20/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class SpendingsTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    let user = User.sharedInstance
    
    @IBOutlet weak var cellName: UITableViewCell!
    
    @IBOutlet var categoriesTableView: UITableView!
    
    
    var tableList: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*self.tableList.addObject("Clothes")
        self.tableList.addObject("Food")
        self.tableList.addObject("Entertainment")*/
        
        for (var i = 0; i<user.expenseCategories.count; i++){
            var tester = true;
            for (var j = 0; j<tableList.count; j++){
                if (tableList[j] as! NSString == user.expenseCategories[i]){
                    tester = false;
                }
            }
            if (tester){
                var categorySum = 0.00;
                for (var p = 0; p < user.itemList.count; p++){
                    if (user.itemList[p].category == user.expenseCategories[i]){
                        categorySum += user.itemList[p].price
                    }
                }
                if (!user.expenseCategories[i].isEmpty){
                    self.tableList.addObject("\(user.expenseCategories[i]) : $\(categorySum)")
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
    
    
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
