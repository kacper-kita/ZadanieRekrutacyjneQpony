//
//  ShowAlert.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert() {
        let alert = UIAlertController(title: "Query Error", message: "The selected range is wrong", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}
