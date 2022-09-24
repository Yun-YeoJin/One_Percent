//
//  ChartPatternHeaderView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/17.
//


import UIKit

import SnapKit
import Then

class ChartPatternHeaderView: UICollectionReusableView {
    
    static let identifier = "ChartPatternHeaderView"
    
    let titleLabel = UILabel().then {
      
        $0.font = UIFont(name: "VITRO CORE TTF", size: 25)
        $0.textAlignment = .center
        $0.textColor = Constants.BaseColor.text
      
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [titleLabel].forEach {
            self.addSubview($0)
        }
    }
    
    func setConstraints() {
    
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(44)
        }
        
    }
    
    
    
}
