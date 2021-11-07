//
//  TableCViewController.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import UIKit

class TableCViewController: UIViewController {
    
    var viewModel = CurrencyListViewModel() // Variable to provide access to viewmodel
    let tableViewCellName = "CustomMainViewCell" // Variable for save cell identifier
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrency()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(UINib(nibName: tableViewCellName, bundle: nil), forCellReuseIdentifier: tableViewCellName)
    }
    
    private func getCurrency() {
        self.startActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.viewModel.getCurrency(table: "C") { (_) in
                self.tableView.reloadData()
                self.stopActivityIndicator()
            }
        }
    }
    
    @IBAction func didTapReload(_ sender: UIButton) {
        getCurrency()
    }
}

extension TableCViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencyVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellName, for: indexPath) as! CustomMainViewCell
        let items = viewModel.currencyVM[indexPath.row]
        cell.nameLabel.text = items.currency
        cell.codeLabel.text = items.code
        cell.dateLabel.text = NetworkManager.shared.dateCurrency
        cell.exchangeLabel.text = String(items.bid)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = viewModel.currencyVM[indexPath.row]
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? CurrencyDetailViewController {
            
            // Pass data to CurrencyDetailViewController
            detailViewController.table = "C"
            detailViewController.name = data.currency
            detailViewController.code = data.code
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
