//
//  Item.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/22/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import Foundation

struct Item {
    var income : Bool
    var name : String
    var price : Double
    var category : String
    var date : Int
    
    init(income : Bool, name : String, price : Double, category : String, date : Int) {
        self.income = income
        self.name = name
        self.price = price
        self.category = category
        self.date = date
    }
    
    /*var Categories = [Item]()
    
    var test = Item(income : false, name : "shirt", price : 25.00, category : "clothing", date : 010115)*/
}