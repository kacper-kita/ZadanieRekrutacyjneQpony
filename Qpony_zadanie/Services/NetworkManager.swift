//
//  NetworkManager.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation

class NetworkManager {
    
    func createURL(path: String) -> URL {
        var components = URLComponents()
        
        components.scheme = "http"
        components.host = "api.nbp.pl"
        components.path = path
        
        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }
        
        return url
    }
}
