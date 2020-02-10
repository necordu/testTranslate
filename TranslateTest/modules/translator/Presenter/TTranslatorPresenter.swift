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
        

    }
    
    func getTranslation(text: String, lang: String) {
        self.interactor.getTranslation(text: text, lang: "en-ru", completionBlock: {
            translate, error in
            
            if (error == nil){
                
//                guard let text = translate?.text else {
//                    print("error in translate")
//                    return
//                }
                
                if (translate?.code == 200) {
                    self.view?.showTranslate(with: translate!.text.first!)
                } else {
                    self.view?.showTranslate(with: "")
                        print("error - \(String(describing: translate?.code))")
                }
                // need to handle translate.code here
            } else {
                //error handling here
                print(error?.localizedDescription as Any)
            }
            
        })
    }
    
    
    
    
}
