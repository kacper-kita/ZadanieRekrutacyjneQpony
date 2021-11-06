//
//  DetailViewModel.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import Foundation

struct DetailViewModel {
    let details: CurrencyRates
    
    var no: String {
        return details.no ?? "Unknown"
    }
    
    var effectiveDate: String {
        return details.effectiveDate ?? "Unknown"
    }
    
    var mid: Double {
        return details.mid ?? 0.0
    }
    
    var bid: Double {
        return details.bid ?? 0.0
    }
}
