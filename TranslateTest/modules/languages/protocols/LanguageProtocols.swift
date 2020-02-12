//
//  LanguageProtocols.swift
//  TranslateTest
//
//  Created by Greenatom on 12.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

protocol LangViewProtocol: class {
    
}

protocol LangPresenterProtocol {
    
    func viewDidLoad()
    func getLanguages() -> NSArray
    
    func dismissLang()
    func selectLanguage(language: String)
    
}

protocol LangInputInteractorProtocol {
    
    
    
}

protocol LangRouterProtocol {
    
    func dismissLang()
    
}
