//
//  GoalsViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/17/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class AddGoals: UIViewController {
    
    @IBOutlet weak var ouputGoal: UILabel!
    @IBOutlet weak var goalField: UITextField!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var timeField: UITextField!  //in weeks
    let user = User.sharedInstance
    
    
    @IBAction func upDateGoals(sender: UIButton) {
        ouputGoal.text = "My goal is to buy a " + goalField.text + " for " + costField.text + " dollars in "+timeField.text + " weeks"
        
        let decimalAsString = costField.text
        var formatter = NSNumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        let decimalAsDoubleUnwrapped = formatter.numberFromString(decimalAsString)
        let decimalAsDouble = decimalAsDoubleUnwrapped!.doubleValue
        
        let decimalAsStringTime = timeField.text
        var formatterTime = NSNumberFormatter()
        formatterTime.locale = NSLocale(localeIdentifier: "en_US")
        let decimalAsDoubleUnwrappedTime = formatter.numberFromString(decimalAsStringTime)
        let decimalAsDoubleTime = decimalAsDoubleUnwrappedTime!.doubleValue
        
        
        user.goals.append(GoalItem(name: "\(user.countGoal+1).\(goalField.text)", neededCash: decimalAsDouble, numWeeks: decimalAsDoubleTime))
        user.countGoal++;
        self.view.endEditing(true)
        print("\(user.goals[(0)].name) , \(user.goals[(0)].neededCash) dollars , \(user.goals[(0)].numWeeks) weeks")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
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
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}