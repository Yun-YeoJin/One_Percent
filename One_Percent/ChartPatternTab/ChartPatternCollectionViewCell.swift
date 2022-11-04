//
//  ChartPatternCollectionViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit

import SnapKit
import Then

final class ChartPatternCollectionViewCell: BaseCollectionViewCell {
    
    let chartImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Constants.BaseColor.border
        $0.clipsToBounds = true
    }
    
    let titleLabel = normalTitleLabel().then {
        $0.adjustsFontSizeToFitWidth = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureUI() {
        [chartImageView, titleLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        chartImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(0)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(chartImageView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(20)
        }
        
    }
    
    
}
