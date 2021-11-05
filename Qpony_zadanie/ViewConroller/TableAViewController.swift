//
//  ViewController.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 04/11/2021.
//

import UIKit

class TableAViewController: UIViewController {
    
    var viewModel = CurrencyListViewModel()
    let tableViewCellName = "CustomMainViewCell"
    
    //MARK: -  Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrency()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
       
        tableView.register(UINib(nibName: tableViewCellName, bundle: nil), forCellReuseIdentifier: tableViewCellName)
    }
    
    private func getCurrency() {
        viewModel.getCurrency(table: "A") { (_) in
            self.tableView.reloadData()
        }
    }
}

extension TableAViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencyVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellName, for: indexPath) as! CustomMainViewCell
        let items = viewModel.currencyVM[indexPath.row]
        cell.nameLabel.text = items.currency
        cell.codeLabel.text = items.code
        cell.dateLabel.text = NetworkManager.shared.dateCurrency
        cell.exchangeLabel.text = String(items.mid)
        
        return cell
    }
}