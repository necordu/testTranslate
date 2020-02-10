//
//  TTranslatorPresenter.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation


class TranslatePresenter {
    
    weak var view: TranslatorViewProtocol?
    var interactor: TranslatorInputInteractorProtocol
    var router: TranslatorRouterProtocol
    
    init(view: TranslatorViewProtocol, interactor: TranslatorInputInteractorProtocol, router: TranslatorRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension TranslatePresenter: TranslatorPresenterProtocol {
    func viewDidLoad() {
        
        self.interactor.getTranslation(text: "Hello", lang: "en", completionBlock: {
            translate, error in
            
            if (error == nil){
                self.view?.showTranslate(with: translate!.text.first!)
                // need to handle translate.code here
            } else {
                //error handling here
                print(error?.localizedDescription as Any)
            }
            
        })

    }
    
    
    
    
}
