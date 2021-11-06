//
//  CurrencyViewModel.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation

struct CurrencyViewModel {
    let currencies: Currencies

    var currency: String {
        return currencies.currency ?? "Unknown"
    }

    var code: String {
        return currencies.code ?? "Unknown"
    }

    var mid: Double {
        return currencies.mid ?? 0.0
    }
    
    var bid: Double {
        return currencies.bid ?? 0.0
    }
}
