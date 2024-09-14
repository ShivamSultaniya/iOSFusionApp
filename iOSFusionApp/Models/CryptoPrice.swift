//
//  CryptoPrize.swift
//  iOSFusionApp
//
//  Created by Shivam Sultaniya on 10/09/24.
//

import Foundation

struct CryptoPrice: Identifiable {
    let id = UUID()
    let date: Date
    let close: Double
}
