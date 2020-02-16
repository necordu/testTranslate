//
//  TTranslatorPresenter.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation


class TranslatePresenter {
    
    //Dictionary put in another folder or file?
    
    let langDictionary = [
        "Английский": "en",
        "Русский": "ru",
        "Японский": "ja"
    ]
    #warning ("change to reverse Dictionary by code")
    let reverseLangDictionary = [
        "en": "Английский",
        "ru": "Русский",
        "ja": "Японский"
    ]

    
    weak var view: TranslatorViewProtocol?
    var interactor: TranslatorInputInteractorProtocol
    var router: TranslatorRouterProtocol
    
    var timer: Timer? = nil
    
    init(view: TranslatorViewProtocol, interactor: TranslatorInputInteractorProtocol, router: TranslatorRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension TranslatePresenter: TranslatorPresenterProtocol {
    
   
    func viewDidLoad() {
        

    }
    
    func langDefine(textLangIn: String, textLangOut: String) -> String {
        
        print("define")
        let inInd = textToInd(key: textLangIn)
        let outInd = textToInd(key: textLangOut)
        
        return inInd + "-" + outInd
    }
    
    func parseLanguageString(string: String) -> (String, String) {
        
        if string.contains("-") {
            
            let stringSplt = string.split(separator: "-")
            let langFirst:String = String(stringSplt[0])
            let langLast: String = String(stringSplt[1])
            return (reverseLangDictionary[langFirst]!, reverseLangDictionary[langLast]!)
            
            
        } else {
            return ("ErrorString","ErrorString")
        }
        
    }
    
    private func textToInd(key: String) -> String {
        
        guard let value = langDictionary[key] else {
            return ""
        }

        return value
        
    }
    
    func getTranslation(text: String, lang: String) {
        
        self.interactor.getTranslation(text: text, lang: lang, completionBlock: { [weak self]
            translate, error in
            
            if (error == nil){
                
                guard let translateObj = translate else {
                    self?.view?.showTranslate(with: "")
                    return
                }
                
                if (translateObj.code == 200) {
                    self?.view?.showTranslate(with: translateObj.text.first!)
                    if (translateObj.text.first!.count != 0 && translateObj.text.first! != text) {
                        //   DispatchQueue.global().async {
                            self?.interactor.saveTranslation(name: text, translation: translateObj.text.first!, language: lang)
                       // }
                    }
                } else {
                    self?.view?.showTranslate(with: "")
                        print("error - \(String(describing: translateObj.code))")
                }
            } else {
                //error handling here
                print(error?.localizedDescription as Any)
            }
            
        })
    }
    
    func presentLanguages() {
        
        router.presentLanguageList()
        
    }
    
}
