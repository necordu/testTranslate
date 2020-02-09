//
//  TTranslator.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import UIKit

class TTranslatorView: UIViewController {
    
    @IBOutlet var translationTextView: UITextView!
    
    var presenter: TranslatorPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TTranslatorView: TranslatorViewProtocol {
    
    
    func showTranslate(with translate: String) {
        translationTextView.text = translate
    }
    
}
