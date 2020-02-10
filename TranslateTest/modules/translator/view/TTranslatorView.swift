//
//  TTranslator.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import UIKit

class TTranslatorView: UIViewController {
    
    @IBOutlet weak var trnslateTextView: UITextView!
    @IBOutlet weak var translationTextView: UITextView!
    @IBOutlet weak var outLang: UIButton!
    @IBOutlet weak var inLang: UIButton!
    @IBOutlet weak var changeLang: UIButton!
    
    var timer: Timer? = nil
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

extension TTranslatorView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(sendToTranslate),
            userInfo: ["textView": trnslateTextView],
            repeats: false)
       //perform(#selector(hel), with: nil, afterDelay: 1.0)
        
    }
    
    @objc func sendToTranslate() {
        presenter.getTranslation(text: trnslateTextView.text, lang: "en-ru")
    }
    
}
