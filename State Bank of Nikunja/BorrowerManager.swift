//
//  BorrowerManager.swift
//  State Bank of Nikunja
//
//  Created by Habibur Rahman on 4/11/22.
//

import Foundation

class BorrowerManager {
    func fetchData(completionHandler: @escaping (Borrower?, Error?) -> Void) {
        let url = URL(string: "https://api.jsonbin.io/b/5fd2b33281ec296ae71c5fd1")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            if let data = data {
                do {
                   let borrower = try JSONDecoder().decode(Borrower.self, from: data)
                    completionHandler(borrower, nil)
                } catch {
                    
                }
            }
            completionHandler(nil, error)
        }.resume()
        
    }
}
