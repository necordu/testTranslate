//
//  TTranslatorInteractor.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation

class TranslatorInteractor {
    
    
    
}


extension TranslatorInteractor: TranslatorInputInteractorProtocol {
    
    func getTranslate() -> Translator {
        return Translator(translate: "This is translation")
    }
    
    
    
    
}
