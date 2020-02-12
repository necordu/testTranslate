//
//  LanguageRouter.swift
//  TranslateTest
//
//  Created by Greenatom on 12.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

class LanguageRouter {
    
    var viewController: UIViewController!
    
    init(view: UIViewController) {
        self.viewController = view
    }
    
}

extension LanguageRouter: LangRouterProtocol {
    
    func dismissLang(){

        self.viewController.dismiss(animated: true, completion: nil)
        
    }
}
