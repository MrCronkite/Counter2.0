//
//  Coins.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import Foundation

// MARK: - Coin
struct Coin: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double
    let priceChange24h: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case priceChange24h = "price_change_24h"
    }
}


typealias Coins = [Coin]
