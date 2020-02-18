//
//  DictionaryTranslation.swift
//  TranslateTest
//
//  Created by Егор Редько on 14.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

struct DictionaryTranslation {
    
    var name: String!
    var translation: String!
    var languageTransaction: String!
    
    init(name: String, translation: String, languageTransaction: String) {
        
        self.name = name
        self.translation = translation
        self.languageTransaction = languageTransaction
        
    }
    
}
