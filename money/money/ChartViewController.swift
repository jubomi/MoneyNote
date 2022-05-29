//
//  FinanceListViewController.swift
//  money
//
//  Created by 주보미 on 2022/05/12.
//

import UIKit
import DropDown
import Charts

class ChartViewController: UIViewController {
    
    
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var barChartView: BarChartView!
    
    
    var months: [String]!
    var unitsSold: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray
        
        setChart(dataPoints: months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "지출량")
        
        chartDataSet.colors = [.systemBlue]
        
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        chartDataSet.highlightEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        
        
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        
        
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        
        // 오른쪽 레이블 제거
        barChartView.rightAxis.enabled = false
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        let ll = ChartLimitLine(limit: 10.0, label: "타겟")
        barChartView.leftAxis.addLimitLine(ll)
        
        
        // 맥시멈
        barChartView.leftAxis.axisMaximum = 30
        // 미니멈
        barChartView.leftAxis.axisMinimum = -10
        
        
        // 백그라운드컬러
        barChartView.backgroundColor = .yellow
        
    }
    /*
     let dropDown = DropDown()
     dropDown.dataSource = ["하루", "일주일", "한 달"]
     dropDown.show()
     */
}

