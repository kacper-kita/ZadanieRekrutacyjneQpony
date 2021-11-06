//
//  CurrencyListViewModel.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation

class CurrencyListViewModel {
    var currencyVM = [CurrencyViewModel]()
    
    func getCurrency(table: String, completion: @escaping ([CurrencyViewModel]) -> Void) {
        NetworkManager.shared.getCurrencies(table: table) { (currencies) in
            guard let currencies = currencies else {
                return
            }
            
            let currencyVM = currencies.map(CurrencyViewModel.init)
            DispatchQueue.main.async {
                self.currencyVM = currencyVM
                completion(currencyVM)
            }
        }
    }
}
