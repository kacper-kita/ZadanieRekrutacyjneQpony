//
//  CurrencyDetailViewController.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import UIKit

class CurrencyDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NetworkManager.shared.getCurrencyDetail(table: "A", code: "USD", startDate: "2021-03-03", endDate: "2021-04-03") { (detail) in
            print("Detail: \(detail?[1].mid)")
        }
    }
}
