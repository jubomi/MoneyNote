//
//  FinanceViewController.swift
//  money
//
//  Created by 주보미 on 2022/05/15.
//

import UIKit

class FinanceListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()

    }
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FinanceListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "financeListCell", for: indexPath) as? FinanceListCell else {
                    return UITableViewCell()
                }
                return cell
    }
}
