//
//  BuyandSellViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/19.
//

import UIKit

import RealmSwift

public protocol SendStockDelegate: AnyObject {
    func sendStockName(_ text: String)
}

final class BuyandSellViewController: BaseViewController, SendStockDelegate {
    
    func sendStockName(_ text: String) {
        mainView.contentSearchBar.text = text
    }
    
    private let mainView = BuyandSellView()
    
    let config = Realm.Configuration(schemaVersion: 1)
    
    lazy var localRealm = try! Realm(configuration: config)
    
    private let repository = StockRepository()
    
    override func loadView() {
        self.view = mainView
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
//MARK: Objc func Methods
extension BuyandSellViewController {
    @objc func cancelButtonClicked() {
        
        self.dismiss(animated: true)
        
    }
    
    @objc func saveButtonClicked() {
        
        if mainView.contentSearchBar.text?.isEmpty ?? true || mainView.priceTextField.text?.isEmpty ?? true || mainView.countTextField.text?.isEmpty ?? true || mainView.selected < 0 {
            showAlert(title: "항목을 선택해주세요!", message: "종목명, 매수/매도, 체결 단가, 수량을 확인하세요!", buttonTitle: "확인") { UIAlertAction in }
        } else {
            
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
}
