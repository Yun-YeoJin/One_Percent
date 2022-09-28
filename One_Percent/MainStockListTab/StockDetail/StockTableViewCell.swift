//
//  StockTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/23.
//

import UIKit

import SnapKit
import Then

class StockTableViewCell: BaseTableViewCell {
    
    let iconImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.tintColor = Constants.BaseColor.text
        $0.contentMode = .scaleAspectFill
    }
    
    let stockNameLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 20)
    }
    
    let dateLabel = UILabel().then {
        $0.text = " 2022/09/23 "
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 17)
    }
    
    let stockQuantityLabel = UILabel().then {
        $0.text = "40주"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
    }
    
    let stockPriceLabel = UILabel().then {
        $0.text = "62,000원"
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
    }
    
    let totalPriceLabel = UILabel().then {
        $0.text = "2,202,000원"
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
        
        [iconImageView, stockNameLabel, dateLabel, stockQuantityLabel, stockPriceLabel].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(12)
            make.width.height.equalTo(30)
        }
        
        stockNameLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(12)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.height.equalTo(30)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(stockNameLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(22)
        }
        
        stockQuantityLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(12)
            make.height.equalTo(30)
        }
        
        stockPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(stockQuantityLabel.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.height.equalTo(30)
        }
        
        
        
    }
}
