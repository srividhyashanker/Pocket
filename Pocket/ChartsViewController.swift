//
//  ChartsViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//
import UIKit
import Charts
class ChartsViewController: UIViewController {
    @IBOutlet weak var lineChartView: LineChartView!
        
    @IBOutlet weak var pieChartView: PieChartView!
    let user = User.sharedInstance
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var individualCategoryPrice = 0.0
        
        for (var i = 0; i < user.expenseCategories.count; i++){
            
            for (var j = 0; j < user.itemList.count; j++){
                
                print(user.itemList[j].price)
                
                if (user.itemList[j].category == user.expenseCategories[i]){
                    
                    individualCategoryPrice += user.itemList[j].price
                    
                    print(user.itemList[j].price)
                    
                }
                
            }
            
            user.categoryPrices.append(individualCategoryPrice)
            
            for (var x = 0; x < user.categoryPrices.count; x++){
                
                print(user.categoryPrices[x])
                
            }
            
            individualCategoryPrice = 0.00;
            
        }
        
        setChart(user.expenseCategories, values: user.categoryPrices)
        
        for (var x = 0; x < user.expenseCategories.count; x++){
            
            user.categoryPrices.removeLast()
            
        }
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        var length = user.categoryPrices.count
        
        for (var i = 0; i<length; i++)
            
        {
            
            println(user.expenseCategories[i])
            
            println(user.categoryPrices[i])
            
            if(user.categoryPrices[i] == 0.0)
                
            {
                
                user.categoryPrices.removeAtIndex(i)
                
                var xy = user.expenseCategories.removeAtIndex(i)
                
                length = length - 1
                
                //user.categoryPrices.removeAtIndex(i)
                
            }
            
        }
        
        for i in 0..<dataPoints.count {
            
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            
            dataEntries.append(dataEntry)
            
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Categories")
        
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        
        pieChartView.data = pieChartData
        
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
        
        lineChartView.data = lineChartData
        
    }
    
}

