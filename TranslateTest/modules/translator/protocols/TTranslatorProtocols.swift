//
//  TTranslatorProtocols.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

protocol TranslatorViewProtocol: class {
    
    func showTranslate(with translate: String)
    
}

protocol TranslatorPresenterProtocol {
    
  //  var interactor: TranslatorInputInteractorProtocol? {get set}
    //var view: TranslatorViewProtocol? {get set}
    //var router: TranslatorRouterProtocol? {get set}
    
    func viewDidLoad()
    func getTranslation(text: String, lang: String)
    //func showTranslate(with translate: Translator, from view: UIViewController)
}

protocol TranslatorInputInteractorProtocol {
    func getTranslation(text: String, lang: String, completionBlock: @escaping(Translator?, Error?) -> ()) -> Void
    //var presenter: TranslatorOutputInteractorProtocol? {get set}
    
  //  func getTranslate()
    
}

protocol TranslatorOutputInteractorProtocol {
    
    //func translateDidFetch(translate: Translator)
    
}

protocol TranslatorRouterProtocol {
    
//    func presentLanguageList(from view: UIViewController)
//    static func createTranslatorModule(TranslatorRef: TTranslatorView)
    
}
