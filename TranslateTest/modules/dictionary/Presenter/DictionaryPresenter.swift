//
//  DictionaryPresenter.swift
//  TranslateTest
//
//  Created by Егор Редько on 14.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

class DictionaryPresenter {

    weak var view: DictViewProtocol?
    var interactor: DictInputInteractorProtocol
    var router: DictRouterProtocol
    
    init(view: DictViewProtocol, interactor: DictInputInteractorProtocol, router: DictRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension DictionaryPresenter: DictPresenterProtocol {
    
    
    func viewDidLoad() {
        
        self.getHistory(search: "")
        
    }
    
    func clearDB() {
            
        interactor.clearDB()
        view?.showWords(words: [])
        
    }
    
    func getHistory(search: String) {
        
        view?.showWords(words: interactor.getTranslation_coreData(search: search))
        
    }
    
}
