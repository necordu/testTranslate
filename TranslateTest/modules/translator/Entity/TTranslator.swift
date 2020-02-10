//
//  TTranslator.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

/*extension CGCart {
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl
        case currency
        case price
        case goodCount
    }

}

struct CGCart: Codable {
    
    public let name: String
    public let price: Int
    public let imageUrl: String
    public var goodCount: Int
    public let currency: String
    
    init(name: String,
                price: Int,
                imageUrl: String,
                goodsCount: Int,
                currency: String) {
      self.name = name
      self.price = price
      self.imageUrl = imageUrl
      self.goodCount = goodsCount
      self.currency = currency
    }

}*/

extension Translator {
    enum CodingKeys: String, CodingKey {

        case text
        case code
        
    }

}

struct Translator: Codable {
    
    public var text: [String]
    public var code: Int
    
    init(text: [String], code: Int) {
        self.text = text
        self.code = code
    }
    
}
