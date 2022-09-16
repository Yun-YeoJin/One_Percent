//
//  CaculateViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit

class CaculateViewController: BaseViewController {
    
    let mainView = CaculateView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.moneyTextField.delegate = self
        self.mainView.rateTextField.delegate = self
        self.mainView.dateTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @objc func caculateButtonClicked() {
        showAlert(title: "희망회로를 돌려봅시다!", message: "원금, 이자율, 투자 기간, 계산 단위를 확인하세요!", buttonTitle: "확인") { action in
            
        }
    }
    
    override func configureUI() {
        
        navigationItem.title = "일 복리 계산기"
        navigationController?.navigationBar.tintColor = .systemMint
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "계산하기", style: .plain, target: self, action: #selector(caculateButtonClicked))
        
    }
    
}

extension CaculateViewController: UITextFieldDelegate {
    
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



