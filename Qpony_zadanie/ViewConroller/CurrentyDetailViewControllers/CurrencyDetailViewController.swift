//
//  CurrencyDetailViewController.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import UIKit

class CurrencyDetailViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    var name = ""
    var code = ""
    var startDateString = ""
    var endDateString = ""
    let tableViewCellName = "DetailTableViewCell"
    var viewModel = DetailListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        setupTableView()
    }
    
    private func getDatePicker() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        startDateString = dateFormater.string(from: startDate.date)
        endDateString = dateFormater.string(from: endDate.date)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 58
        tableView.register(UINib(nibName: tableViewCellName, bundle: nil), forCellReuseIdentifier: tableViewCellName)
    }
    
    private func getCurrency() {
        getDatePicker()
        self.startActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getDetails(table: "A", code: self.code, startDate: self.startDateString, endDate: self.endDateString) { (_) in
                self.tableView.reloadData()
                self.stopActivityIndicator()
            }
        }
    }
    
    //MARK: - Actions
    
    @IBAction func didTapReload(_ sender: UIButton) {
        if !tableView.visibleCells.isEmpty {
            getCurrency()
        }
    }

    @IBAction func didTapOK(_ sender: UIButton) {
        getCurrency()
    }
}

extension CurrencyDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.detailVM.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellName, for: indexPath) as! DetailTableViewCell
        
        let items = viewModel.detailVM[indexPath.row]
        
        cell.dateLabel.text = items.effectiveDate
        cell.rateLabel.text = String(items.mid)
        
        return cell
    } 
}
