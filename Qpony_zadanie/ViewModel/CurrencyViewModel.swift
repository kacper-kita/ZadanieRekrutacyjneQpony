//
//  CurrencyViewModel.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation

struct CurrencyViewModel {
//    let currencies: Currencies
//
//    var currency: String {
//        return currencies.currency ?? "Unknown"
//    }
//
//    var code: String {
//        return currencies.code ?? "Unknown"
//    }
//
//    var mid: Double {
//        return currencies.mid ?? 0.0
//    }
    
    let currency: Currency
    
    var effectiveDate: String {
        return currency.effectiveDate ?? "Unknown"
    }
    
    var rates: [Currencies]? {
        guard let rates = currency.rates else {return nil}
        
        return rates
    }

}
