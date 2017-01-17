//
//  GoalsAnalysisViewController.swift
//  Pocket
//
//  Created by Jananni Rathnagiri on 7/27/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class GoalsAnalysisViewController: UIViewController {
    let user = User.sharedInstance
    
    @IBOutlet weak var analysisOutput: UILabel!
    
    @IBOutlet weak var goalNameTitle: UINavigationItem!
    
    //@IBOutlet weak var greenButtox: UIButton!
    
    //@IBOutlet weak var test: UIButton!
   //@IBOutlet weak var yellowButtox: UIButton!
    //@IBOutlet weak var titleLabel: UILabel!
    //@IBOutlet weak var redButtox: UIButton!
    override func viewDidLoad() {
        goalNameTitle.title = user.chosenGoal.name
        
        super.viewDidLoad()
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
        var profit = totalSavings - totalSpendings
        var q = 0
        var currentNumber = "";
        
        while ((Array(user.chosenGoal.name)[q] != ".")){
            var a = (Array(user.chosenGoal.name)[q])
            currentNumber = ("\(currentNumber)\(a)")
            q++
            
        }
        //titleLabel.text = currentNumber
        var intCurrentNumber = currentNumber.toInt()!
        user.countGoal = intCurrentNumber
        
        var weeks = user.goals[user.countGoal - 1].numWeeks
        var cash = user.goals[user.countGoal - 1].neededCash
        var totalProfit = (profit)*(weeks)
        
        if(totalProfit > (2/3)*(cash))
        {
            print("hey")
            analysisOutput.text = "Congratulations! Continue how you're doing, and you'll be able to reach your goal easily!"
            //self.performSegueWithIdentifier("greenSegue", sender: self)    //viewcontroller with image view of green speedometer
            /*greenButtox.titleLabel?.text = "Click for progress"
            yellowButtox.titleLabel?.text = ""
            redButtox.titleLabel?.text = ""*/
            //test.setTitle("tester", forState: .Normal)
            print("no")
            
        }
        else if(totalProfit > (1/3)*(cash))
        {
            print("hey6")
            //import yellow
            analysisOutput.text = "You're doing okay, try to cut down on your spendings or get a side job so that you can confidently reach your goal!"
          //  self.performSegueWithIdentifier("yellowSegue", sender: self)
            //viewcontroller with image view of yellow speedometer
            /*greenButtox.titleLabel?.text = ""
            yellowButtox.titleLabel?.text = "Click for progress"
            redButtox.titleLabel?.text = ""*/
            print("yes")
        }
        else if(totalProfit>0.0)
        {
            print("hey10")
            //import red
            analysisOutput.text = "Sorry! Based on your previous spending patterns, it doesn't seem like it will be easy to reach your goal!"
        //    self.performSegueWithIdentifier("redSegue", sender: self)
            //viewcontroller with image view red speedometer
            /*greenButtox.titleLabel?.text = ""
            yellowButtox.titleLabel?.text = ""
            redButtox.titleLabel?.text = "Click for progress"*/
            print("ok")
        }
        else
        {
            //print need more data
            analysisOutput.text = "You're going to need more data in order for us to easily gage your progress!"
            /*greenButtox.titleLabel?.text = ""
            yellowButtox.titleLabel?.text = ""
            redButtox.titleLabel?.text = ""*/
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


