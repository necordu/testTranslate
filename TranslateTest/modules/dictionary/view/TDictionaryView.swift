//
//  TDictionaryView.swift
//  TranslateTest
//
//  Created by Егор Редько on 09.02.2020.
//  Copyright © 2020 necordu. All rights reserved.
//

import UIKit

class TDictionaryView: UIViewController {
    
    var presenter: DictPresenterProtocol!
    
    var timer: Timer? = nil
    var searchText: String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var historyTableView: UITableView!
    
    var translationArr: [DictionaryTranslation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.keyboardDismissMode = .onDrag
        
        //WHERE put this in VIPER?
        NotificationCenter.default.addObserver(self, selector: #selector(search), name: .didCoreDataChanged, object: nil)

        presenter.viewDidLoad()
    }
    
    @IBAction func clearDB(_ sender: Any) {
        let alert = UIAlertController(title: "Прежупреждение", message: "Вы хотите удалить всю историю?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in

            self.presenter.clearDB()

        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .didCoreDataChanged, object: nil)
    }
    
}

extension TDictionaryView: UITableViewDelegate {
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            guard let tabBar = self.view.window?.rootViewController as? UITabBarController else { return }
            tabBar.selectedIndex = 0
            
            let word = translationArr[indexPath.row]
            let wordNotificationData: [String: String] = ["name": word.name, "translation": word.translation, "languageTransaction": word.languageTransaction]
            NotificationCenter.default.post(name: .didWordSelected, object: nil, userInfo: wordNotificationData)
            
        }
    
}

extension TDictionaryView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchText = searchText
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(search),
                                     userInfo: ["searchBar": searchBar],
                                     repeats: false)
      //  timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (timer) in
        //    self.presenter.getHistory(search: searchText)
    //    })
        
        
    }
    
    @objc func search () {
        
        self.presenter.getHistory(search: searchText)
        
    }
    
}

extension TDictionaryView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return translationArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.cellIdentifier, for: indexPath) as! HistoryCell
        
        let word = translationArr[indexPath.row]
        cell.nameLabel.text = word.name
        cell.translationLabel.text = word.translation
        
        
        return cell
        
    }


}

extension TDictionaryView: DictViewProtocol {
    
    func showWords(words: [DictionaryTranslation]) {
        
        translationArr = words
        historyTableView.reloadData()
        
    }
    
}

class HistoryCell: UITableViewCell {
    
    static let cellIdentifier = "historyCell"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    
    
}
