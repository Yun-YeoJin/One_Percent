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
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textAlignment = .left
        $0.textColor = Constants.BaseColor.text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [titleLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.leading.trailing.equalTo(8)
            make.height.equalTo(20)
            
        }
    }
    
}
