//
//  TLanguagesView.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import UIKit

class TLanguagesView: UIViewController {
    
    var presenter: LangPresenterProtocol!
    var langArray: NSArray!

    @IBOutlet weak var languageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        langArray = presenter.getLanguages()
        presenter.viewDidLoad()
        
    }

    @IBAction func cancelLanguages(_ sender: Any) {
        
        presenter.dismissLang()
        
    }
    
}

extension TLanguagesView: LangViewProtocol{
    
    
    
}

extension TLanguagesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let languages = langArray else {
            return
        }
        presenter.selectLanguage(language: languages[indexPath.row] as! String)
        
    }
    
}

extension TLanguagesView: UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: langCell.cellIdentifier, for: indexPath) as! langCell
        guard let languages = langArray else {return UITableViewCell()}
        let language = languages[indexPath.row]
        
        cell.langNameLabel.text = (language as! String)
        
        return cell
        
    }
}

class langCell: UITableViewCell {
    
    static let cellIdentifier = "langCell"
    @IBOutlet weak var langNameLabel: UILabel!
    
    
}
