//
//  GoalItem.swift
//  Pocket
//
//  Created by Jananni Rathnagiri on 7/22/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import Foundation

struct GoalItem{
    var name: String
    var neededCash: Double
    var numWeeks: Double
    
    init(name: String, neededCash: Double, numWeeks:Double)
    {
        self.name = name
        self.neededCash = neededCash
        self.numWeeks = numWeeks
        
    }
    
}
