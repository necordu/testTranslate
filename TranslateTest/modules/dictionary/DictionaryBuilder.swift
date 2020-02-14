//
//  DictionaryBuilder.swift
//  TranslateTest
//
//  Created by Greenatom on 14.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

class DictionaryModuleBuilder {
    
    static func build() -> TDictionaryView {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "DictionaryViewController") as! TDictionaryView
        let interactor = DictionaryInteractor()
        let router = DictionaryRouter(view: view)
        let presenter = DictionaryPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
        
    }
    
}
