//
//  ViewController.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 04/11/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.shared.getCurrencies(table: "A") { (currencies) in
            guard let currencies = currencies else {
                return
            }
            print("Currency: \(currencies[1])")
        }
    }
}

