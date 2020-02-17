//
//  LanguagesModuleBuilder.swift
//  TranslateTest
//
//  Created by Greenatom on 12.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

class LanguageModuleBuilder {
    
    /**
        Создание компонентов ViewController для экрана выбора языка под архитектуру VIPER
        - Parameters:
            - delegate: Делегат для изменения языка на экране перевода
        - returns:
            Контроллер типа TLanguagesView для отображения
    */
    static func build(delegate: LangDelegate) -> TLanguagesView {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "LanguageViewController") as! TLanguagesView
        let interactor = LanguageInteractor()
        let router = LanguageRouter(view: view)
        let presenter = LanguagePresenter(view: view, interactor: interactor, router: router, delegate: delegate)
        view.presenter = presenter
        return view
        
    }
    
}
