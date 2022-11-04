//
//  SettingTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/22.
//

import UIKit

import SnapKit
import Then

final class SettingTableViewCell: BaseTableViewCell {
    
    let iconImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.tintColor = Constants.BaseColor.text
        $0.contentMode = .scaleAspectFill
    }
    
    let settingLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 17)
    }
    
    let versionLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 17)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
    }
    
    override func configureUI() {
        
        [iconImageView, settingLabel, versionLabel].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        
        iconImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(30)
        }
        
        settingLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
            make.height.equalTo(30)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
    }
}

