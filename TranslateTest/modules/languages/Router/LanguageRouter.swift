//
//  LanguageRouter.swift
//  TranslateTest
//
//  Created by Егор Редько on 12.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

class LanguageRouter {
    
    unowned var viewController: UIViewController!
    
    init(view: UIViewController) {
        self.viewController = view
    }
    
}

extension LanguageRouter: LangRouterProtocol {
    
    func dismissLang(){

        self.viewController.dismiss(animated: true, completion: nil)
        
    }
}
