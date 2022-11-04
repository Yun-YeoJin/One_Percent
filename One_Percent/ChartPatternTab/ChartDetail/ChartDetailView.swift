//
//  ChartDetailView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/18.
//

import UIKit

import SnapKit
import Then

final class ChartDetailView: BaseView {
    
    let chartImageView = UIImageView().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    let titleLabel = normalTitleLabel().then {
        $0.text = "제목"
    }
    
    let descriptionLabel = contentsLabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "여기가 내용"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureUI() {
        [chartImageView, titleLabel, descriptionLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        chartImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(30)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(chartImageView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
    }
    
}
