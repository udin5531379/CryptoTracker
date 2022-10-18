//
//  Double.swift
//  CryptoTracker
//
//  Created by Udin Rajkarnikar on 10/16/22.
//

import Foundation

extension Double {
    
    
//    private var numberFormatter: NumberFormatter {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//        numberFormatter.minimumFractionDigits = 2
//        numberFormatter.maximumFractionDigits = 2
//        return numberFormatter
//    }
    
    private func formatter(numberStyle: NumberFormatter.Style, groupingSeperator: Bool) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = numberStyle
        formatter.usesGroupingSeparator = groupingSeperator
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    func currencyToString() -> String {
        let number = NSNumber(value: self)
        return formatter(numberStyle: .currency, groupingSeperator: true).string(from: number) ?? "$0.00"
    }
    
    func percentageToString() -> String {
        let number = NSNumber(value: self)
        return formatter(numberStyle: .percent, groupingSeperator: false).string(from: number) ?? "0%"
    }
    
    func numberFormatter() -> String {
        let number = NSNumber(value: self)
        return formatter(numberStyle: .decimal, groupingSeperator: false).string(from: number) ?? "0.00"
    }
    
}
