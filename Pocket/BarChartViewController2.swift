//
//  BarChartViewController2.swift
//  Charts
//
//  Created by Srividhya Shanker on 7/27/15.
//  Copyright (c) 2015 dcg. All rights reserved.
//

import UIKit
import Charts
class BarChartViewController2: UIViewController, ChartViewDelegate {
    @IBOutlet weak var barChartView2: BarChartView!
    let user = User.sharedInstance
    override func viewDidLoad()
    {
        super.viewDidLoad()
        barChartView2.delegate = self
    //let unitsSold = [90.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    
        var indIncomePrice = 0.0
        for(var i = 0; i < user.incomeCategories.count; i++)
            {
                for(var j = 0; j < user.itemList.count; j++)
                    {
                        if(user.itemList[j].category == user.incomeCategories[i])
                        {
                            indIncomePrice += user.itemList[j].price
                        }
                    }
                user.incomePrices.append(indIncomePrice)
                indIncomePrice = 0.0
            }
        for (var i = 0; i<user.incomePrices.count; i++)
        {
            print(user.incomePrices[i])
        }
        setChart(user.incomeCategories, values: user.incomePrices)
        for (var x = 0; x < user.incomeCategories.count; x++)
        {
            user.incomePrices.removeLast()
        }
    }
func setChart(dataPoints: [String], values: [Double]) {
    barChartView2.noDataText = "You need to provide data for the chart."
    for (var x = 0; x<user.incomeCategories.count; x++){
        // print(user.incomeCategories[x])
    }
    var dataEntries: [BarChartDataEntry] = []
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
        
        let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
        
        dataEntries.append(dataEntry)
        
    }
    let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Income Categories")
    let chartData = BarChartData(xVals: user.incomeCategories, dataSet: chartDataSet)
    barChartView2.data = chartData
    barChartView2.descriptionText = ""
    chartDataSet.colors = [UIColor(red: 12/255, green: 50/255, blue: 138/255, alpha: 1)]
    barChartView2.xAxis.labelPosition = .Bottom
    barChartView2.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
    //let ll = ChartLimitLine(limit: 10.0, label: "Target")
    
   // barChartView2.rightAxis.addLimitLine(ll)
}
func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
    
    println("\(entry.value) in \(user.incomeCategories[entry.xIndex])")
    
}

@IBAction func saveChart(sender: UIBarButtonItem) {
    
    barChartView2.saveToCameraRoll()
    
}



}