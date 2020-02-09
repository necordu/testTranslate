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
    
    func showTranslate(with treanslate: Translator)
    
}

protocol TranslatorPresenterProtocol {
    
    var interactor: TranslatorInputInteractorProtocol? {get set}
    var view: TranslatorViewProtocol? {get set}
    var router: TranslatorRouterProtocol? {get set}
    
    func viewDidLoad()
    func showTranslate(with translate: Translator, from view: UIViewController)
}

protocol TranslatorInputInteractorProtocol {
    var presenter: TranslatorOutputInteractorProtocol? {get set}
    
    func getTranslate()
    
}

protocol TranslatorOutputInteractorProtocol {
    
    func translateDidFetch(translate: Translator)
    
}

protocol TranslatorRouterProtocol {
    
    func presentLanguageList(from view: UIViewController)
    static func createTranslatorModule(TranslatorRef: TTranslatorView)
    
}
