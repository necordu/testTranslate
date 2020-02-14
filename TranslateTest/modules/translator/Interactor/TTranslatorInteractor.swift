//
//  TTranslatorInteractor.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TranslatorInteractor {
 
    
}


extension TranslatorInteractor: TranslatorInputInteractorProtocol {

    
    func getTranslation(text: String, lang: String, completionBlock: @escaping(Translator?, Error?) -> ()) -> Void {
        
        let url = URL(string: "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20200210T074258Z.cfd54b2e06114303.8736ba0ddd6032ed94136635fb167a6e42dc6cb1&text=\(text)&lang=\(lang)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler:  { data, response, error in

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
    
    func saveTranslation(name: String?, translation: String?){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.persistentStoreCoordinator = managedContext.persistentStoreCoordinator
        privateContext.perform {
            
            let word = Word(context: privateContext)
            
            let dictionary = Dictionary(context: privateContext)
            
            let words = dictionary.mutableSetValue(forKey: #keyPath(Dictionary.words))
            
            guard let name = name, let translation = translation else { return}
            word.name = name
            word.translation = translation
            
            words.add(word)
            
            do{
                try privateContext.save()
                #warning("CHECK PLACE FOR NOTIFICATION")
                NotificationCenter.default.post(name: .didCoreDataChanged, object: nil)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
        }
        
    }
    
}

