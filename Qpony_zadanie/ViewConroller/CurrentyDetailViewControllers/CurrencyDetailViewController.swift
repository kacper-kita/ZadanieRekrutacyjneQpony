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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
    }
    
    //MARK: - Actions
    
    @IBAction func didTapReload(_ sender: UIButton) {
    }

    @IBAction func didTapOK(_ sender: UIButton) {
    }
}

extension CurrencyDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    } 
}
