//

//  BarChartViewController.swift

//  iOSChartsDemo

//

//  Created by Joyce Echessa on 6/12/15.

//  Copyright (c) 2015 Appcoda. All rights reserved.

//


import UIKit

import Charts


class BarChartViewController: UIViewController, ChartViewDelegate {
    @IBOutlet weak var barChartView: BarChartView!
    // @IBOutlet weak var emptyLabel: UILabel!
    let user = User.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.delegate = self
        let unitsSold = [90.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    
        var indCategoryPrice = 0.0
        
        
        
        
        
        for(var i = 0; i < user.expenseCategories.count; i++)
            
        {
            
            for(var j = 0; j < user.itemList.count; j++)
                
            {
                
                if(user.itemList[j].category == user.expenseCategories[i])
                    
                {
                    
                    indCategoryPrice += user.itemList[j].price
                    
                }
                
            }
            
            user.categoryPrices.append(indCategoryPrice)
            
            // user.lastCategory++
            
            indCategoryPrice = 0.0
            
        }
        
        
        
        
        
        for (var i = 0; i<user.categoryPrices.count; i++){
            
            print(user.categoryPrices[i])
            
        }
        
        setChart(user.expenseCategories, values: user.categoryPrices)
        
        for (var x = 0; x < user.expenseCategories.count; x++){
            
            user.categoryPrices.removeLast()
            
        }
        
        
        
    }
    
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        barChartView.noDataText = "You need to provide data for the chart."
        
        
        
        for (var x = 0; x<user.expenseCategories.count; x++){
            
            // print(user.expenseCategories[x])
            
        }
        
        var dataEntries: [BarChartDataEntry] = []
        
        
        
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
            
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            
            dataEntries.append(dataEntry)
            
        }
        
        
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Expense Categories")
        
        let chartData = BarChartData(xVals: user.expenseCategories, dataSet: chartDataSet)
        
        barChartView.data = chartData
        
        
        
        barChartView.descriptionText = ""
        
        
        
        chartDataSet.colors = [UIColor(red: 12/255, green: 50/255, blue: 138/255, alpha: 1)]
        
        //        chartDataSet.colors = ChartColorTemplates.colorful()
        
        
        
        barChartView.xAxis.labelPosition = .Bottom
        
        
        
        //        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
        
        
        //        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        
        
    //    let ll = ChartLimitLine(limit: 10.0, label: "Target")
        
    //    barChartView.rightAxis.addLimitLine(ll)
        
        
        
    }
    
    
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        
        println("\(entry.value) in \(user.expenseCategories[entry.xIndex])")
        
    }
    
    
    
    @IBAction func saveChart(sender: UIBarButtonItem) {
        
        barChartView.saveToCameraRoll()
        
    }
    
    
    
}