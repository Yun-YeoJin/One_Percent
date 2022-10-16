//
//  ButtonView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/10/16.
//

import UIKit

class CalculateButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setTitleColor(Constants.BaseColor.text, for: .normal)
        layer.cornerRadius = 10
        layer.borderColor = Constants.BaseColor.border
        backgroundColor = Constants.BaseColor.textField
        
    }
}

class BuyandSellButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setTitleColor(Constants.BaseColor.text, for: .normal)
        layer.cornerRadius = 25
        layer.borderColor = Constants.BaseColor.border
        backgroundColor = Constants.BaseColor.textField
    }
}

