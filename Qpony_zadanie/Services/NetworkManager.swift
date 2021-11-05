//
//  NetworkManager.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
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
    
    func getCurrencies(table: String, completion: @escaping ([Currency]?) -> Void) {
        let path = "/api/exchangerates/tables/\(table)/"
        
        let url = createURL(path: path)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let currencies = try? JSONDecoder().decode([Currency].self, from: data)
            currencies == nil ? completion(nil) : completion(currencies)
        }.resume()
    }
}
