//
//  HomeViewController.swift
//  money
//
//  Created by 주보미 on 2022/05/08.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var expensesListView: UIView!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender .selectedSegmentIndex == 0 {
            expensesListView.alpha = 1.0
            chartView.alpha = 0.0
        } else {
            expensesListView.alpha = 0.0
            chartView.alpha = 1.0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
