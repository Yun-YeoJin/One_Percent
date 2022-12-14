//
//  ChartPatternView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/16.
//

import UIKit

import SnapKit
import Then

final class ChartPatternView: BaseView {
 
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()
    
    let searchBar = UISearchBar().then {
        $0.placeholder = "차트 검색하기"
        $0.backgroundColor = Constants.BaseColor.background
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureUI() {
        [collectionView, searchBar].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
    
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(0)
            make.bottom.leading.trailing.equalTo(0)
        }
    }

    
}
