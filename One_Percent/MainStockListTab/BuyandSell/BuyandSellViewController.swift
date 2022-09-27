//
//  BuyandSellViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/19.
//

import UIKit

import RealmSwift
import JGProgressHUD

protocol SendStockDelegate: AnyObject {
    func sendStockName(_ text: String)
}


class BuyandSellViewController: BaseViewController, SendStockDelegate {
    
    func sendStockName(_ text: String) {
        mainView.contentSearchBar.text = text
    }
    
    //let hud = JGProgressHUD()
    
    let mainView = BuyandSellView()
    
    let config = Realm.Configuration(schemaVersion: 1)

    lazy var localRealm = try! Realm(configuration: config)
    
    let repository = StockRepository()
    
    //var stockList: [StockNameModel] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.priceTextField.delegate = self
        self.mainView.countTextField.delegate = self
        
        self.mainView.contentSearchBar.delegate = self
        
        print("Realm:",localRealm.configuration.fileURL!)
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func configureUI() {
        
        navigationItem.title = "매매일지 추가하기"
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장하기", style: .done, target: self, action: #selector(saveButtonClicked))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.app"), style: .done, target: self, action: #selector(cancelButtonClicked))
        
    }
    
    @objc func cancelButtonClicked() {
        
        self.dismiss(animated: true)
        
    }
    
    @objc func saveButtonClicked() {
        
        let stockname = mainView.contentSearchBar.text ?? ""
        
        var price = self.mainView.priceTextField.text ?? ""
        price = price.replace(target: ",", withString: "")
        guard let stockprice = Int(price) else { return }
                             
        var quantity = self.mainView.countTextField.text ?? ""
        quantity = quantity.replace(target: ",", withString: "") //콤마 없애기
        guard let stockquantity = Int(quantity) else { return }
        
        let stockdate = mainView.dateDatePicker.date
        
        if mainView.selected == 0 {
            let task = Stock(stockName: stockname, isBuy: true, stockPrice: stockprice, stockQuantity: stockquantity, stockDate: stockdate)
            repository.fetchStock(task)
        } else {
            let task = Stock(stockName: stockname, isBuy: false, stockPrice: stockprice, stockQuantity: stockquantity, stockDate: stockdate)
            repository.fetchStock(task)
        }
        
        dismiss(animated: true)
        
    }
  
}

extension BuyandSellViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        
        if let removeAllSeprator = textField.text?.replacingOccurrences(of: formatter.groupingSeparator, with: ""){
            var beforeForemattedString = removeAllSeprator + string
            if formatter.number(from: string) != nil {
                if let formattedNumber = formatter.number(from: beforeForemattedString), let formattedString = formatter.string(from: formattedNumber){
                    textField.text = formattedString
                    return false
                }
            } else {
                if string == "" {
                    let lastIndex = beforeForemattedString.index(beforeForemattedString.endIndex, offsetBy: -1)
                    beforeForemattedString = String(beforeForemattedString[..<lastIndex])
                    if let formattedNumber = formatter.number(from: beforeForemattedString), let formattedString = formatter.string(from: formattedNumber){
                        textField.text = formattedString
                        return false
                    }
                } else {
                    return false
                }
            }
            
        }
        
        return true
        
    }
}

extension BuyandSellViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        let vc = SearchViewController()
        vc.delegate = self
        transition(vc, transitionStyle: .present)
        
        dismisskeyboard()
    }
    
    func dismisskeyboard() {
        view.endEditing(true)
    }
    
   
    
}
