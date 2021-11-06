//
//  DetailListViewModel.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import Foundation

class DetailListViewModel {
    var detailVM = [DetailViewModel]()
    
    func getDetails(table: String, code: String, startDate: String, endDate: String, completion: @escaping ([DetailViewModel]) -> Void) {
        NetworkManager.shared.getCurrencyDetail(table: table, code: code, startDate: startDate, endDate: endDate) { details in
            guard let details = details else {
                return
            }
            
            let detailVM = details.map(DetailViewModel.init)
            DispatchQueue.main.async {
                self.detailVM = detailVM
                print(detailVM)
                completion(detailVM)
            }
        }
    }
}
