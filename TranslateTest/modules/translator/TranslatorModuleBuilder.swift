//
//  TranslatorModeuleBuilder.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

class TranslatorModuleBuilder {
    
    static func build() -> TTranslatorView {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "TranslatorViewController") as! TTranslatorView
        let interactor = TranslatorInteractor()
        let router = TranslatorRouter(view: view)
        let presenter = TranslatePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
        
    }
    
}
