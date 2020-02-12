//
//  TTranslator.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

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
