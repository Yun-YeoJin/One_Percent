//
//  OpenSourceLicenseTableViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/28.
//

import UIKit

import SnapKit
import Then

class OpenSourceLicenseTableViewCell: BaseTableViewCell {
    
    let opensourceNameLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 20)
        $0.adjustsFontSizeToFitWidth = true
    }
    
    let opensourceURL = UILabel().then {
        $0.textColor = .systemBlue
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
        $0.adjustsFontSizeToFitWidth = true
    }
    
    let copyrightLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
        $0.adjustsFontSizeToFitWidth = true
    }
    
    let MITLicenseLabel = UILabel().then {
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
        [opensourceNameLabel, opensourceURL, copyrightLabel, MITLicenseLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        opensourceNameLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
        opensourceURL.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(opensourceNameLabel.snp.bottom).offset(4)
            make.height.equalTo(20)
        }
        copyrightLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(opensourceURL.snp.bottom).offset(4)
            make.height.equalTo(20)
        }
        MITLicenseLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(8)
            make.top.equalTo(copyrightLabel.snp.bottom).offset(4)
            make.height.equalTo(20)
        }
        
        
        
    }
    
}

