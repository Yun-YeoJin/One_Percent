//
//  ChartPatternCollectionViewCell.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit

import SnapKit
import Then

class ChartPatternCollectionViewCell: BaseCollectionViewCell {
    
    let unsplashImageView = UIImageView().then {
        $0.backgroundColor = .clear
    }
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.textColor = Constants.BaseColor.text
        $0.text = "패턴이름"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [unsplashImageView, titleLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        unsplashImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(0)
            make.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(unsplashImageView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(20)
        }
        
    }
    
    
}
