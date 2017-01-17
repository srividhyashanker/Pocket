//
//  User.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/22/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import Foundation
import Firebase

var ref = Firebase(url:"https://pocketbudget.firebaseio.com")
/*let user = User.sharedInstance
var usersRef = ref.childByAppendingPath(user)*/


class User {
    
    class var sharedInstance: User {
        struct Static {
            static var instance: User?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = User()
        }
        
        return Static.instance!
    }
    
    
    var itemList = [Item]()
    var incomeCategories = [String]()
    var expenseCategories = [String]()
    var chosenCategory = ""
    var chosenGoal = GoalItem(name: "", neededCash: 0.0, numWeeks: 0.0)
    var countGoal = 0
    var chosenIncomeCategory = ""
    var categoryPrices = [Double]()
    var goals = [GoalItem]()
    var incomePrices = [Double]()
    
    func saveStuff(){
        
        var usersRef = ref.childByAppendingPath("users")
        
        var users = ["incomeCategories": incomeCategories, "expenseCategories":expenseCategories]
        usersRef.setValue(users)
        ref.updateChildValues(users)
        
    }
    
    init() {
        
    }
    
    
}

/*var itemList = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
var incomeCategories = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
var expenseCategories = []

var usersRef = ref.childByAppendingPath("users")

var users = ["itemList": itemList, "incomeCategories": incomeCategories, "expenseCategories":expenseCategories]
usersRef.setValue(users)*/

