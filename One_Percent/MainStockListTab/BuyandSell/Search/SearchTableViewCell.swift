//
//  SearchTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/26.
//

import UIKit

import SnapKit
import Then

class SearchTableViewCell: BaseTableViewCell {
    
    let stockNumberLabel = UILabel().then {
        $0.text = "A018260"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
    }
    
    let stockMarketLabel = UILabel().then {
        $0.text = "KOSPI"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
    }
    
    let stockNameLabel = UILabel().then {
        $0.text = "삼성에스디에스"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
