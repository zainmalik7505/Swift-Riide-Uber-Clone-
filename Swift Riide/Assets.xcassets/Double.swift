//
//  Double.swift
//  Swift Riide
//
//  Created by Zain Malik on 06/09/2024.
//

import Foundation

extension Double{
    
    private var currencyFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
        
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(from: self as NSNumber) ?? ""
        
    }
}
