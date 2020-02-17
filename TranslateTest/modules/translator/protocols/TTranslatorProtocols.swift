//
//  TTranslatorProtocols.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit


protocol LangDelegate: class {
    func changeLanguage(language: String)
}

protocol TranslatorViewProtocol: class {
    
    func showTranslate(with translate: String)
    
}

protocol TranslatorPresenterProtocol {
    
    func viewDidLoad()
    func getTranslation(text: String, lang: String)
    func langDefine(textLangIn:String, textLangOut: String) -> String
    func parseLanguageString(string: String) -> (String, String)
    func presentLanguages()
    
}

protocol TranslatorInputInteractorProtocol {
    
    func getTranslation(text: String, lang: String, completionBlock: @escaping(Translator?, Error?) -> ()) -> Void
    func saveTranslation(name: String?, translation: String?, language: String?)
    
}

protocol TranslatorRouterProtocol {
    
    func presentLanguageList()
    
}
