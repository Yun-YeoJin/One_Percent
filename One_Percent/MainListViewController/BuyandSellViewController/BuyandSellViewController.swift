//
//  BuyandSellViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/19.
//

import UIKit

class BuyandSellViewController: BaseViewController {
    
  
    let mainView = BuyandSellView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.priceTextField.delegate = self
        self.mainView.countTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func configureUI() {
        
        navigationItem.title = "매매일지 추가하기"
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장하기", style: .done, target: .none, action: #selector(saveButtonClicked))
        
    }
    
    @objc func saveButtonClicked() {
        
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
