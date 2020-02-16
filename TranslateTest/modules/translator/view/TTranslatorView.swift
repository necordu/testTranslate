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
    @IBOutlet weak var changeLangButton: UIButton!
    
    // ???
    var outText: String!
    var inText: String!
    
    var translateDirection: translateDirection!
    
    var timer: Timer? = nil
    var presenter: TranslatorPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inText = inLang.titleLabel!.text
        outText = outLang.titleLabel!.text
        NotificationCenter.default.addObserver(self, selector: #selector(putWords(_:)), name: .didWordSelected, object: nil)
        
        self.presenter.viewDidLoad()
    }
    
    @IBAction func changeLang(_ sender: Any) {
        
        switch (sender as! UIButton).tag {
        case 0:
            presenter.presentLanguages()
            translateDirection = .inTr
            break
        case 1:
            
            (inText, outText) = (outText, inText)
            let temp = outLang.titleLabel!.text
            outLang.setTitle(inLang.titleLabel!.text, for: .normal)
            inLang.setTitle(temp, for: .normal)
            
            self.sendToTranslate()
            break
        case 2:
            presenter.presentLanguages()
            translateDirection = .outTr
            break
        default:
            break
            
    }

}
    
    @objc func putWords(_ notification: NSNotification) {
        
        guard let name =  notification.userInfo!["name"] as? String, let translation = notification.userInfo!["translation"] as? String, let languageTransaction = notification.userInfo!["languageTransaction"] as? String else {return}
        
        trnslateTextView.text = name
        translationTextView.text = translation
        let tupleLanguage = presenter.parseLanguageString(string: languageTransaction)
        inLang.setTitle(tupleLanguage.0, for: .normal)
        outLang.setTitle(tupleLanguage.1, for: .normal)
        
        
        
        
    }
    
    deinit{
               
               NotificationCenter.default.removeObserver(self, name: .didWordSelected, object: nil)
               
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
            userInfo: nil,
            repeats: false)
        
    }
    
    @objc private func sendToTranslate() {
        
        trnslateTextView.resignFirstResponder()
        presenter.getTranslation(
            text: trnslateTextView.text,
            lang: presenter.langDefine(textLangIn: inText, textLangOut: outText))
        
    }
    
    
}
//show language (?Should be in presenter?)
extension TTranslatorView: LangDelegate {
    func changeLanguage(language: String) {
        switch translateDirection {
        case .inTr:
            if language != outLang.titleLabel?.text {
                inLang.setTitle(language, for: .normal)
                inText = language
            } else {
                self.changeLang(changeLangButton!)
            }
        case .outTr:
            if language != inLang.titleLabel?.text {
                outLang.setTitle(language, for: .normal)
                outText = language
            } else {
                self.changeLang(changeLangButton!)
            }
        default:
            break
        }
        self.sendToTranslate()
    }
    
}
