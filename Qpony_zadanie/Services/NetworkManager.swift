//
//  NetworkManager.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    lazy var dateCurrency = "Unknown"
    
    func createURL(path: String) -> URL {
        var components = URLComponents()
        
        components.scheme = "http"
        components.host = "api.nbp.pl"
        components.path = path
        let queryItemToken = URLQueryItem(name: "format", value: "json")
        components.queryItems = [queryItemToken]
        
        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }
        
        return url
    }
    
    func getCurrencies(table: String, completion: @escaping ([Currencies]?) -> Void) {
        let path = "/api/exchangerates/tables/\(table)/"
        
        let url = createURL(path: path)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let currencies = try? JSONDecoder().decode([Currency].self, from: data)
            self.dateCurrency = currencies?.first?.effectiveDate ?? "Unknown"
            currencies == nil ? completion(nil) : completion(currencies?.first?.rates)
        }.resume()
    }
    
    func getCurrencyDetail(table: String, code: String, startDate: String, endDate: String, completion: @escaping ([CurrencyRates]?) -> Void) {
        let path = "/api/exchangerates/rates/\(table)/\(code)/\(startDate)/\(endDate)/"
        
        let url = createURL(path: path)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let detail = try? JSONDecoder().decode(CurrencyDetail.self, from: data)
            detail == nil ? completion(nil) : completion(detail?.rates)
        }.resume()
    }
}
