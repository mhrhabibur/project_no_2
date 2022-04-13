//
//  Borrower.swift
//  State Bank of Nikunja
//
//  Created by Habibur Rahman on 4/11/22.
//

import Foundation

struct Borrower: Codable {
    let data: [Data]
}

struct Data: Codable {
    
    let name: String
    let principalAmount: String
    let interestRate: String
    let tenureInMonth: String
    
    var interest: Double {
        var tenureInMonths: Double?
        let principal = Double(principalAmount)!
        let rate = Double(interestRate)!
        if let time = Double(tenureInMonth) {
            tenureInMonths = time
        }
        let year = (tenureInMonths ?? 1) / 12
        let result = principal * pow(1 + rate / 100, year)
        return result - principal
    }
    
}

