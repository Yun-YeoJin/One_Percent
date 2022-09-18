//
//  ChartDetailView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/18.
//

import UIKit

import SnapKit
import Then

class ChartDetailView: BaseView {
    
    let chartImageView = UIImageView().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = Constants.BaseColor.text
        $0.textAlignment = .center
        $0.text = "여기가 제목"
    }
    
    let descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .center
        $0.textColor = Constants.BaseColor.text
        $0.numberOfLines = 0
        $0.text = "여기가 내용"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [chartImageView, titleLabel, descriptionLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        chartImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(chartImageView.snp.bottom).offset(40)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(44)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
    }
    
}
