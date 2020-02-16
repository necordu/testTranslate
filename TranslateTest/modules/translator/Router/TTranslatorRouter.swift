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
    
    unowned var viewController: UIViewController!
    
    init(view: UIViewController) {
        self.viewController = view
    }
    
}

extension TranslatorRouter: TranslatorRouterProtocol {
    
    func presentLanguageList() {
        
        let languagesViewController = LanguageModuleBuilder.build(delegate: (self.viewController as! TTranslatorView))
        self.viewController.present(languagesViewController, animated: true, completion: nil)
        
    }
    
}
