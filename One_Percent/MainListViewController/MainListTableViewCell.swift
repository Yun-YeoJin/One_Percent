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
    
    let stockNameLabel = UILabel().then {
        $0.text = "삼성전자"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let earningRateLabel = UILabel().then {
        $0.text = " 수익률 : "
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let rateLabel = UILabel().then {
        $0.text = " +4.4% "
        $0.textColor = .systemRed
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let underBarView = UIView().then {
        $0.backgroundColor = Constants.BaseColor.text
        $0.layer.borderColor = Constants.BaseColor.border
    }
    
    let stockPriceLabel = UILabel().then {
        $0.text = "평균 매수가 : 59,320원"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let stockCurrentPriceLabel = UILabel().then {
        $0.text = "현재 주가 : 62,100원"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let stockQuantityLabel = UILabel().then {
        $0.text = "수량(주) : 300주"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let totalPriceLabel = UILabel().then {
        $0.text = "총 평가액 : 18,630,000원"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
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
        
        [stockNameLabel, earningRateLabel, rateLabel, underBarView, stockPriceLabel, stockCurrentPriceLabel, stockQuantityLabel, totalPriceLabel].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        
        stockNameLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.leading.equalTo(16)
            make.height.equalTo(20)
        }
        
        earningRateLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.trailing.equalTo(rateLabel.snp.leading).offset(-16)
            make.height.equalTo(20)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(20)
        }
        
        underBarView.snp.makeConstraints { make in
            make.top.equalTo(stockNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(1)
        }
        
        stockPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(underBarView.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.height.equalTo(20)
        }
        
        stockCurrentPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(stockPriceLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.height.equalTo(20)
        }
        
        stockQuantityLabel.snp.makeConstraints { make in
            make.top.equalTo(stockCurrentPriceLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.height.equalTo(20)
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(stockQuantityLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.height.equalTo(20)
        }
        
        
        
        
        
    }
}
