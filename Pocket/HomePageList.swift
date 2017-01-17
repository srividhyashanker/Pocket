//
//  HomePageList.swift
//  Pocket
//
//  Created by Jananni Rathnagiri on 7/27/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

//

import UIKit

class HomePageList: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    let user = User.sharedInstance
    
    
    @IBOutlet weak var SavingsTableView: UITableView!
    
    var tableList: NSMutableArray! = NSMutableArray()
    
    @IBOutlet weak var SavingsLabel: UILabel!
    @IBOutlet weak var SpendingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableList.addObject("Clothes")
        self.tableList.addObject("Food")
        self.tableList.addObject("Entertainment")
        
        for (var i = 0; i<user.itemList.count; i++){
            var tester = true;
            for (var j = 0; j<tableList.count; j++){
                if (tableList[j].name as! NSString == user.itemList[i].name){
                    tester = false;
                }
            }
            if (tester){
                var categorySum = 0.00;
                for (var p = 0; p < user.itemList.count; p++){
                    if(!user.itemList[p].income)
                    {
                        categorySum += user.itemList[p].price
                        self.tableList.addObject(user.itemList[p].name)
                    }
                }
            }
        }
        
        var totalSavings = 0.0
        for(var a = 0; a < user.itemList.count; a++)
        {
            if(user.itemList[a].income)
            {
                totalSavings += user.itemList[a].price
            }
        }
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
        /*for (var i = 0; i<user.expenseCategories.count; i++){
        if (user.expenseCategories[i].isEmpty){
        user.expenseCategories.removeAtIndex(i)
        }
        }*/
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
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")as! UITableViewCell
        
        cell.textLabel?.text = self.tableList.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
}