//
//  SpendingsAnalysisTableViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/26/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class GoalAnalysis: UIViewController{
    let user = User.sharedInstance
    
    @IBOutlet weak var goalName: UILabel!
    
    override func viewDidLoad() {
        goalName.text = user.chosenGoal
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
