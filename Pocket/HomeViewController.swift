//
//  HomeViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/17/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    let user = User.sharedInstance
    var tableList: NSMutableArray! = NSMutableArray()
    
    @IBOutlet weak var SavingsTableView: UITableView!
    
    @IBOutlet weak var minus: UILabel!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var SavingsLabel: UILabel!
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var SpendingsLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        var tester = true;
        var textColor: UIColor!

        
        /*self.tableList.addObject("Clothes")
        self.tableList.addObject("Food")
        self.tableList.addObject("Entertainment")*/
        
        for (var i = 0; i<user.itemList.count; i++)
        {
            var tester = true;
            for (var j = 0; j<tableList.count; j++)
            {
               if (tableList[j] as! NSString == user.itemList[i].name)
               {
                    tester = false;
                }
            }
            if (tester)
            {
                if (user.itemList[i].income){
                    self.tableList.addObject("Income: \(user.itemList[i].name) : $\(user.itemList[i].price)")
                }
                else{
                    self.tableList.addObject("Expense: \(user.itemList[i].name) : $\(user.itemList[i].price)")
                }
            }
        
        }
        
        var totalSavings = 0.0
        var totalSpendings = 0.0
        for(var i = 0; i < user.itemList.count; i++)
        {
            if(user.itemList[i].income)
            {
                totalSavings += user.itemList[i].price
            }
            else
            {
                totalSpendings += user.itemList[i].price
            }
        }
        var totalProfit = totalSavings - totalSpendings
        SavingsLabel.text = ("Total Savings: $\(totalSavings)")
        SpendingsLabel.text = ("Total Spendings: $\(totalSpendings)")
        TotalLabel.text = ("Total Profit: $\(totalProfit)")
        
    
    }
    

     override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        // MARK: - Table view data source
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return self.tableList.count
        }
    
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")as! UITableViewCell
        
        cell.textLabel?.text = self.tableList.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    


}
