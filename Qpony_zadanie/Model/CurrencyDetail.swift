//
//  CurrencyDetail.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import Foundation

struct CurrencyRates: Decodable {
    let no: String?
    let effectiveDate: String?
    let mid: Double?
}

struct CurrencyDetail: Decodable {
    let table: String?
    let currency: String?
    let code: String?
    let rates: [CurrencyRates]?
}
