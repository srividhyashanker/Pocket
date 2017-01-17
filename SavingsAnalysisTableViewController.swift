//
//  SavingsAnalysisTableViewController.swift
//  Pocket
//
//  Created by Jananni Rathnagiri on 7/27/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class SavingsAnalysisTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    let user = User.sharedInstance
    
    @IBOutlet var itemTableView: UITableView!
    @IBOutlet weak var categoryName: UINavigationItem!
    
    
    var tableList: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        categoryName.title = user.chosenIncomeCategory
        super.viewDidLoad()
        //navigationHead.text =
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var q = 0
        var catString = ""
        while ((Array(user.chosenIncomeCategory)[q] != " ")){
            var a = (Array(user.chosenIncomeCategory)[q])
            catString = ("\(catString)\(a)")
            q++
        }
        for (var p = 0; p<user.itemList.count; p++){
            if (user.itemList[p].category == catString){
                self.tableList.addObject("\(user.itemList[p].name) : $\(user.itemList[p].price)")
            }
        }
        
        //self.tableList.addObject(catString)
        //user.chosenCategory.substringToIndex(<#index: String.Index#>)
        /*for (var i = 0; i<user.itemList.count; i++){
        
        }*/
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = self.tableList.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    
}
