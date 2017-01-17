//
//  ChartsViewController2.swift
//  Pocket
//
//  Created by Srividhya Shanker on 7/27/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController2: UIViewController {

        @IBOutlet weak var lineChartView2: LineChartView!
        @IBOutlet weak var pieChartView2: PieChartView!
        let user = User.sharedInstance
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var individualIncomePrice = 0.0
        
        for (var i = 0; i < user.incomeCategories.count; i++){
            
            for (var j = 0; j < user.itemList.count; j++){
                
                print(user.itemList[j].price)
                
                if (user.itemList[j].category == user.incomeCategories[i]){
                    
                    individualIncomePrice += user.itemList[j].price
                    
                    print(user.itemList[j].price)
                    
                }
                
            }
            
            user.incomePrices.append(individualIncomePrice)
            
            for (var x = 0; x < user.incomePrices.count; x++){
                
                print(user.incomePrices[x])
                
            }
            
            individualIncomePrice = 0.00;
            
        }
        
        setChart(user.incomeCategories, values: user.incomePrices)
        
        for (var x = 0; x < user.incomeCategories.count; x++){
            
            user.incomePrices.removeLast()
            
        }
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        var length = user.incomePrices.count
        
        for (var i = 0; i<length; i++)
            
        {
            
            println(user.incomeCategories[i])
            
            println(user.incomePrices[i])
            
            if(user.incomePrices[i] == 0.0)
                
            {
                
                user.incomePrices.removeAtIndex(i)
                
                var xy = user.incomeCategories.removeAtIndex(i)
                
                length = length - 1
                
                //user.incomePrices.removeAtIndex(i)
                
            }
            
        }
        
        for i in 0..<dataPoints.count {
            
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            
            dataEntries.append(dataEntry)
            
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Categories")
        
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        
        pieChartView2.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            
            let red = Double(arc4random_uniform(256))
            
            let green = Double(arc4random_uniform(256))
            
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            
            colors.append(color)
            
        }
        
        pieChartDataSet.colors = colors
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Categories")
        
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        
        lineChartView2.data = lineChartData
        
    }
    
}
