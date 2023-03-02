//
//  Double.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 03.03.2023.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
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
