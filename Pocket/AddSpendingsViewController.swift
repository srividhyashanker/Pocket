//
//  AddSpendingsViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/21/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class AddSpendingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var Categories: UIPickerView!
    
    @IBOutlet weak var ExpenseNameField: UITextField!
    
    @IBOutlet weak var NewCategoryField: UITextField!
    
    @IBOutlet weak var AmountNameField: UITextField!
    
    
    let user = User.sharedInstance
    
    var placementAnswer = 0
    
    
    //(AmountNameField.text as NSString).doubleValue
    
    @IBAction func DoneButton(sender: AnyObject) {
        
        let decimalAsString = AmountNameField.text
        var formatter = NSNumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        let decimalAsDoubleUnwrapped = formatter.numberFromString(decimalAsString)
        let decimalAsDouble = decimalAsDoubleUnwrapped!.doubleValue
        
        if (!NewCategoryField.text.isEmpty){
            user.itemList.append(Item(income : false, name : ExpenseNameField.text, price : decimalAsDouble, category : NewCategoryField.text, date : 010115))
        }
        else{
            user.itemList.append(Item(income : false, name : ExpenseNameField.text, price : decimalAsDouble, category : user.expenseCategories[placementAnswer], date : 010115))
        }
        var tester = true
        for (var i = 0; i<user.expenseCategories.count; i++){
            if (user.expenseCategories[i] == NewCategoryField.text){
                tester = false
            }
        }
        if (tester){
            user.expenseCategories.append(NewCategoryField.text)
        }
        
        
        
    }
    //var categoriesArr = user.itemList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading
        Categories.delegate = self
        Categories.dataSource = self
        
        
        //Looks for single or multiple taps.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func TouchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //categoryImport.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        return user.expenseCategories[row]
        //UIPickerView.reloadAllComponents(<#UIPickerView#>)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return 1;
        return user.expenseCategories.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        var pickerLabel = view as? UILabel;
        if (pickerLabel == nil)
        {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Montserrat", size: 4)
            pickerLabel?.textAlignment = NSTextAlignment.Center
        }
        pickerLabel?.text = user.expenseCategories[row]
        return pickerLabel!;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placementAnswer = row
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

