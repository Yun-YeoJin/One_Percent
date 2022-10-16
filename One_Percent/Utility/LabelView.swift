//
//  MainLabelView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/10/16.
//

import UIKit

class contentsLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        font = .systemFont(ofSize: 15)
        textColor = Constants.BaseColor.text
    }
}

class newsTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        font = UIFont(name: "ChosunSm", size: 20)
        textColor = Constants.BaseColor.text
    }
}

class normalTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        font = .boldSystemFont(ofSize: 20)
        textAlignment = .center
        textColor = Constants.BaseColor.text
    }
}

class calculateLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        textColor = Constants.BaseColor.text
        font = UIFont(name: "VITRO PRIDE TTF", size: 15)
        textAlignment = .left
        
    }
}

class BuyandSellLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        textColor = Constants.BaseColor.text
        font = UIFont(name: "VITRO PRIDE TTF", size: 17)
        textAlignment = .left
        
    }
}

