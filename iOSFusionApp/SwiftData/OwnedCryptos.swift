//
//  OwnedCryptos.swift
//  iOSFusionApp
//
//  Created by Shivam Sultaniya on 15/09/24.
//

import Foundation
import SwiftData

@Model
class OwnedCryptos{
    var cryptoSymbol: String
    var quantity: Double
    var priceAtWhichBought: Double
    var totalInvestment: Double
    
    init(cryptoSymbol: String, quantity: Double, priceAtWhichBought: Double, totalInvestment: Double) {
        self.cryptoSymbol = cryptoSymbol
        self.quantity = quantity
        self.priceAtWhichBought = priceAtWhichBought
        self.totalInvestment = totalInvestment
    }
}
