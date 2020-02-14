//
//  DictionaryRouter.swift
//  TranslateTest
//
//  Created by Greenatom on 14.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit


class DictionaryRouter {
    
    var viewController: TDictionaryView!
    
    init(view: TDictionaryView) {
        self.viewController = view
    }
    
}

extension DictionaryRouter: DictRouterProtocol {
    
    
    
}
