//
//  LangugaePresenter.swift
//  TranslateTest
//
//  Created by Егор Редько on 12.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

class LanguagePresenter {
    
    weak var view: LangViewProtocol?
    var interactor: LangInputInteractorProtocol
    var router: LangRouterProtocol
    
    weak var delegate: LangDelegate?
    
    init(view: LangViewProtocol, interactor: LangInputInteractorProtocol, router: LangRouterProtocol, delegate: LangDelegate) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }
    
}

extension LanguagePresenter: LangPresenterProtocol {
    func viewDidLoad() {
        
    }
    
    func getLanguages() -> NSArray {
        
        return ["Английский", "Русский", "Японский"]
        
    }
    
    func dismissLang() {
        router.dismissLang()
    }
    
    func selectLanguage(language: String) {
        
        delegate?.changeLanguage(language: language)
        router.dismissLang()
        
    }
    
    
}
