//
//  EquityStock.swift
//  EquityLister
//
//  Created by Manjunath on 21/12/19.
//  Copyright © 2019 Accionlabs. All rights reserved.
//

import UIKit

class EquityStock: NSObject {
    var symbol: String!
    var isCustom: String!
    var name: String!
    var primaryExchange: String!
    var exchange: String!
    var secType: String!
    var issuer: String!
    var currency: String!
    var equityID: String!

    init(fromDictionary dictionary: NSDictionary) {
        symbol = dictionary["symbol"] as? String
        isCustom = dictionary["isCustom"] as? String
        name = dictionary["name"] as? String
        primaryExchange = dictionary["primaryExchange"] as? String
        exchange = dictionary["exchange"] as? String
        secType = dictionary["secType"] as? String
        issuer = dictionary["issuer"] as? String
        currency = dictionary["currency"] as? String
        equityID = "\(dictionary["id"]!)"
    }
}
