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
            self.viewModel.getCurrency(table: "A") { (_) in
                self.tableView.reloadData()
                self.stopActivityIndicator()
            }
        }
    }
    
    @IBAction func didTapReload(_ sender: UIButton) {
        getCurrency()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = viewModel.currencyVM[indexPath.row]
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? CurrencyDetailViewController {
            detailViewController.table = "A"
            detailViewController.name = data.currency
            detailViewController.code = data.code
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
