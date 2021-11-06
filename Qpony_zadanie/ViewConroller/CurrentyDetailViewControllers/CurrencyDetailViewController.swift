//
//  CurrencyDetailViewController.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import UIKit

class CurrencyDetailViewController: UIViewController {
    
    var name = ""
    var code = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailData: \(name)")
    }
}
