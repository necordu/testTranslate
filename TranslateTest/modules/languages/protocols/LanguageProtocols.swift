//
//  LanguageProtocols.swift
//  TranslateTest
//
//  Created by Егор Редько on 12.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

protocol LangViewProtocol: class {
    
}

protocol LangPresenterProtocol {
    
    /**
       Метод для выполнения логика при первой загрузки экрана
    */
    func viewDidLoad()
    /**
       Метод для получения списка доступных языков
        - returns:
        Массив из названий языков
    */
    func getLanguages() -> NSArray
    /**
       Метод для подготовки экран к  закрытию модального окна, комнда передается далее роутеру
    */
    func dismissLang()
    /**
       Метод для выбора языка по тапу на строку таблицы
        - Parameters:
           - language: Строка с выбранным языком
    */
    func selectLanguage(language: String)
    
}

protocol LangInputInteractorProtocol {
    
    
    
}

protocol LangRouterProtocol {
    /**
        Зкарытие модального окна
    */
    func dismissLang()
    
}
