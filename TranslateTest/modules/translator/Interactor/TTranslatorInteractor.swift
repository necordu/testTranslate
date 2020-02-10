//
//  TTranslatorInteractor.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit

class TranslatorInteractor {
    
 
    
}


extension TranslatorInteractor: TranslatorInputInteractorProtocol {

    
    func getTranslation(text: String, lang: String, completionBlock: @escaping(Translator?, Error?) -> ()) -> Void {
        
        let url = URL(string: "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20200210T074258Z.cfd54b2e06114303.8736ba0ddd6032ed94136635fb167a6e42dc6cb1&text=\(text)&lang=\(lang)")!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler:  { data, response, error in

            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                DispatchQueue.main.async {
                    completionBlock(nil, error)
                }
                return
            }

            do {
              //  let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let translation = try JSONDecoder().decode(Translator.self, from: data!)
                DispatchQueue.main.async {
                    completionBlock(translation, nil)
                }
                
            } catch {
                DispatchQueue.main.async {
                    completionBlock(nil, error)
                }
            }
        })

        task.resume()
    }
    
}

