//
//  TextFieldView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/10/16.
//

import UIKit

class TextFieldView: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = Constants.BaseColor.textField
        layer.cornerRadius = 25
        textAlignment = .center
        keyboardType = .numberPad
        
    }
}
