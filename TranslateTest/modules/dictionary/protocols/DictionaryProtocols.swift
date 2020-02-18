//
//  DictionaryProtocols.swift
//  TranslateTest
//
//  Created by Егор Редько on 14.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

protocol DictViewProtocol: class {
    
    /**
    Метод для показа пользователю списка сохраненных слов
     - Parameters:
        - words: Массив, содержащий объекты типа DictionaryTranslation - в нем сожержится слово и его перевод
     */
    func showWords(words: [DictionaryTranslation])
    
}

protocol DictPresenterProtocol {
    /**
       Метод для выполнения логика при первой загрузки экрана
    */
    func viewDidLoad()
    /**
       Метод который подготавливает приложения к очистке БД и затем передает команду интерактеру
    */
    func clearDB()
    /**
       Метод для получения слов из локальной БД с возможностью поиска слов по предоставленнйо строке
        - Parameters:
            - search: Строка по которой ведется поиск слов
    */
    func getHistory(search: String)

}

protocol DictInputInteractorProtocol {
    
    /**
       Метод для полной очистки БД от сохраненных слов
    */
    func clearDB()
    /**
       Метод для получения слов из локальной БД с возможностью поиска слов по предоставленнйо строке, результат вернется к презентеру
        - Parameters:
            - search: Строка по которой ведется поиск слов
        - returns:
        Массив, содержащий объекты типа DictionaryTranslation - в нем сожержится слово и его перевод
    */
    func getTranslation_coreData(search: String) -> [DictionaryTranslation]
    
}

protocol DictRouterProtocol {
    
    
    
}
