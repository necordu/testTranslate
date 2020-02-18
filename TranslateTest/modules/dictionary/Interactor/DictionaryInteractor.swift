//
//  DictionaryInteractor.swift
//  TranslateTest
//
//  Created by Егор Редько on 14.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class DictionaryInteractor {
    
    
    
}


extension DictionaryInteractor: DictInputInteractorProtocol {
    
    func clearDB() {
            
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        var tasks: [Any] = []
        do {
            tasks = try managedContext.fetch(Dictionary.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
        
        for task in tasks {
            managedContext.delete(task as! NSManagedObject)
        }
        
        do{
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func getTranslation_coreData(search: String) -> [DictionaryTranslation] {
            
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = appDelegate.persistentContainer.viewContext
            
        var tasks: [Any] = []
        do {
            tasks = try managedContext.fetch(Dictionary.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
         
        let wordsArray = NSMutableArray()
        for task in tasks {
            for word in (task as! Dictionary).words! {
                if (search.count == 0 || (((word as! Word).name?.contains(search))! || ((word as! Word).translation?.contains(search))!)) {
                    let dictTranslation = DictionaryTranslation(name: (word as! Word).name!, translation: (word as! Word).translation!, languageTransaction: (word as! Word).langTransaction!)
                    wordsArray.insert(dictTranslation, at: 0)
                }
            }
        }
            
        return wordsArray as NSArray as! [DictionaryTranslation]
        
    }
    
    
}
