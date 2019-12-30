//
//  Asset.swift
//  EquityLister
//
//  Created by Manjunath on 21/12/19.
//  Copyright © 2019 Accionlabs. All rights reserved.
//

import Foundation

class Asset: NSObject {
    var askPrice: Double!
    var bidPrice: Double!
    var cashDividend: Double!
    var contractName: String!
    var country: String!
    var currency: String!
    var cusip: String!
    var exchange: String!
    var highPrice: Double!
    var issuer: String!
    var lastPrice: Double!
    var lowPrice: Double!
    var openPrice: Double!
    var pricingDate: String!
    var splitRatio: Double!
    var subclass: String!
    var symbol: String!
    var volume: Int!

    var askPriceKey = "Asking Price :"
    var bidPriceKey = "Bidding price :"
    var cashDividendKey = "Caash Dividend :"
    var highPriceKey = "High Price :"
    var lowPriceKey = "Low Price :"
    var lastPriceKey = "Last Price :"
    var openPriceKey = "Open Price :"
    var pricingDateKey = "Pricing Date :"

    init(fromDictionary dictionary: NSDictionary) {
        askPrice = dictionary["askPrice"] as? Double ?? 00.00
        bidPrice = dictionary["bidPrice"] as? Double ?? 00.00
        cashDividend = dictionary["cashDividend"] as? Double ?? 00.00
        contractName = dictionary["contractName"] as? String
        country = dictionary["country"] as? String
        currency = dictionary["currency"] as? String
        cusip = dictionary["cusip"] as? String
        exchange = dictionary["exchange"] as? String
        highPrice = dictionary["highPrice"] as? Double ?? 00.00
        issuer = dictionary["issuer"] as? String
        lastPrice = dictionary["lastPrice"] as? Double ?? 00.00
        lowPrice = dictionary["lowPrice"] as? Double ?? 00.00
        openPrice = dictionary["openPrice"] as? Double ?? 00.00
        pricingDate = dictionary["pricingDate"] as? String
        splitRatio = dictionary["splitRatio"] as? Double ?? 00.00
        subclass = dictionary["subclass"] as? String
        symbol = dictionary["symbol"] as? String
        volume = dictionary["volume"] as? Int
    }
}
