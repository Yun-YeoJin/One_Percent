//
//  SettingTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/22.
//

import UIKit

import SnapKit
import Then

class SettingTableViewCell: BaseTableViewCell {
    
    let iconImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.tintColor = Constants.BaseColor.text
        $0.contentMode = .scaleAspectFill
    }
    
    let settingLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 20)
    }
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        [iconImageView, settingLabel].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
            make.leading.equalTo(16)
            make.width.height.equalTo(30)
        }
        
        settingLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.trailing.equalTo(-16)
            make.height.equalTo(30)
        }
    }
}

