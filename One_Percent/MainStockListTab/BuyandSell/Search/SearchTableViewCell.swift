//
//  SearchTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/26.
//

import UIKit

import SnapKit
import Then

final class SearchTableViewCell: BaseTableViewCell {
    
    let stockNumberLabel = contentsLabel().then {
        $0.textAlignment = .left
    }
    
    let stockMarketLabel = contentsLabel().then {
        $0.textAlignment = .left
    }
    
    let stockNameLabel = contentsLabel().then {
        $0.textAlignment = .left
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
    }
    
    override func configureUI() {
        
        [stockNumberLabel, stockMarketLabel, stockNameLabel].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        
        stockNumberLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
            //make.height.equalTo(20)
        }
        
        stockMarketLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.equalTo(stockNumberLabel.snp.trailing).offset(12)
            //make.height.equalTo(20)
        }
        
        stockNameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            //make.leading.equalTo(stockMarketLabel.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(16)
            //make.height.equalTo(20)
        }
    }
}
