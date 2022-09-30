//
//  MainListTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/12.
//

import UIKit

import SnapKit
import Then

class MainListTableViewCell: BaseTableViewCell {
    
    let backgroundImageView = UIImageView().then {
        $0.backgroundColor = .opaqueSeparator
        $0.alpha = 0.7
        $0.layer.borderColor = Constants.BaseColor.border
        $0.layer.cornerRadius = 20
    }
    
    let stockNameLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let closePriceLabel = UILabel().then {
        $0.text = "전일종가 :"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 17)
    }
    
    let closePriceRateLabel = UILabel().then {
        $0.text = "불러오는중"
        $0.textColor = Constants.BaseColor.point
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 17)
    }
    
    let underBarView = UIView().then {
        $0.backgroundColor = Constants.BaseColor.text
        $0.layer.borderColor = Constants.BaseColor.border
    }
    
    let stockPriceLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let stockQuantityLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let totalPriceLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let buyandsellButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .clear
        $0.setTitle("매수", for: .normal)
    }
    
    let stockDateLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .right
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         self.backgroundColor = .clear
        
    }
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        [backgroundImageView, stockNameLabel, closePriceLabel, closePriceRateLabel, underBarView, stockPriceLabel, stockQuantityLabel, totalPriceLabel, buyandsellButton, stockDateLabel].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.leading.top.bottom.trailing.equalToSuperview().inset(8)
        }
        
        buyandsellButton.snp.makeConstraints { make in
            make.top.equalTo(underBarView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(44)
            make.height.equalTo(30)
        }
        
        stockNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
        }
        
        closePriceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.trailing.equalTo(closePriceRateLabel.snp.leading).offset(-4)
            make.height.equalTo(20)
        }
        
        closePriceRateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        underBarView.snp.makeConstraints { make in
            make.top.equalTo(stockNameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
        
        stockPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(underBarView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        stockQuantityLabel.snp.makeConstraints { make in
            make.top.equalTo(stockPriceLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(stockQuantityLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        stockDateLabel.snp.makeConstraints { make in
            make.top.equalTo(stockQuantityLabel.snp.bottom).offset(8)
            make.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        
        
        
        
    }
}
