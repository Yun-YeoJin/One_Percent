//
//  NewsTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/13.
//

import UIKit

import SnapKit
import Then

class NewsTableViewCell: BaseTableViewCell {
    
    let titleLabel = newsTitleLabel().then {
        $0.textAlignment = .left
    }
    
    let pubDateLabel = contentsLabel().then {
        $0.textAlignment = .left
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [titleLabel, pubDateLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(0)
            make.height.equalTo(30)
        }
        
        pubDateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.height.equalTo(20)
        }
    }
    
}
