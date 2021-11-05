//
//  Currency.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation

struct Currencies: Decodable {
    let currency: String
    let code: String
    let mid: Double
}

struct Currency: Decodable {
    let table: String
    let no: String
    let effectiveDate: Date
    let rates: [Currencies]
}
