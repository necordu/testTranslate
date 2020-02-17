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
    /**
    Метод для изменения языка с/на который переводится слово
     
    - Parameters:
        - language: Строка содержащая название языка
    
    */
    func changeLanguage(language: String)
}

protocol TranslatorViewProtocol: class {
    
    /**
    Метод показывает перевод пользвателю
     
     - Parameters:
        - translate: Строка содержащая перевод слова, который будет показан пользователю
    */
    func showTranslate(with translate: String)
    
}

protocol TranslatorPresenterProtocol {
    /**
        Метод для выполнения логика при первой загрузки экрана
     */
    func viewDidLoad()
    /**
       Метод для получения перевода текста от интерактора
        - Parameters:
            - text: Строка, которую нужно перевести
            - lang: язык с которого и на который нужно перевести, передается в формате in-out, в котором in - язык с которого переводят, а out - языка на который переводят
    */
    func getTranslation(text: String, lang: String)
    /**
    Определение идентивикатора языков, на который нужно перевести слово

    - Parameters:
       - textLangIn: Язык, который с которого будет переводиться слово
       - textLangOut: Язык, на который будет переводиться слово

    - returns:
    Строка с возвращающая идентификатор для перевода - в формате in-out, в котором in - язык с которого переводят, а out - языка на который переводят
    */
    func langDefine(textLangIn:String, textLangOut: String) -> String
    /**
    Парсит строку с идентификаторами из формата in-out, в котором in - язык с которого переводят, а out - языка на который переводят, в tuple из языков
     - Parameters:
        - string: Строка с идентификаторами разделенная знаком "-"
     - returns:
     Tuple из строк - 1-я язык с которого переводится слово, 2-ая -  язык на который это слово переводится
     */
    func parseLanguageString(string: String) -> (String, String)
    /**
        Метод который вызывает метод в router для переход на экран выбора языка
     */
    func presentLanguages()
    
}

protocol TranslatorInputInteractorProtocol {
    /**
    Получение из интернета перевода слова
     - Parameters:
        - text: Слово, которое нужно перевести
        - lang: Идентификаторы языка с которого и на который нужно перевести в формате in-out, в котором in - язык с которого переводят, а out - языка на который переводят
        - completionBlock: Clousure для выхода после запроса, возвращает либо заполненную Entity  типа  Translator в случае удачи, либо Error в случае ошибки
     */
    func getTranslation(text: String, lang: String, completionBlock: @escaping(Translator?, Error?) -> ()) -> Void
    /**
    Сохранение слова в локальной  БД
     - Parameters:
        - name: Слово, которое переводят
        - translation: Перевод слова
        - language: Идентификаторы языка с которого и на который нужно перевести в формате in-out, в котором in - язык с которого переводят, а out - языка на который переводят
     */
    func saveTranslation(name: String?, translation: String?, language: String?)
    
}

protocol TranslatorRouterProtocol {
    /**
            Переход на экран выбора языка
     */
    func presentLanguageList()
    
}
