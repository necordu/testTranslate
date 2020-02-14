//
//  DictionaryProtocols.swift
//  TranslateTest
//
//  Created by Greenatom on 14.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

protocol DictViewProtocol: class {
    
    func showWords(words: [DictionaryTranslation])
    
}

protocol DictPresenterProtocol {
    
    func viewDidLoad()
    func clereDB()
    func getHistory(search: String)
    func searchWord(word: String) -> [DictionaryTranslation]

}

protocol DictInputInteractorProtocol {
    
    func clearDB()
    func getTranslation_coreData(search: String) -> [DictionaryTranslation]
    
}

protocol DictRouterProtocol {
    
    
    
}
