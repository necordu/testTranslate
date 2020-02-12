//
//  TTranslatorRouter.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

class TranslatorRouter {
    
    var viewController: TTranslatorView!
    
    init(view: TTranslatorView) {
        self.viewController = view
    }
    
}

extension TranslatorRouter: TranslatorRouterProtocol {
    
    func presentLanguageList() {
        
        let languagesViewController = LanguageModuleBuilder.build(delegate: self.viewController)
        self.viewController.present(languagesViewController, animated: true, completion: nil)
        
    }
    
}
