//
//  MainListView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/12.
//

import UIKit

import SnapKit
import Then

class MainListView: BaseView {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .insetGrouped)
        view.register(MainListTableViewCell.self, forCellReuseIdentifier: MainListTableViewCell.reusableIdentifier)
        view.rowHeight = 70
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
    
    let weatherView = UIImageView().then {
        $0.image = UIImage(named: "backgroundImage")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.alpha = 0.5
    }
    
    let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        button.backgroundColor = Constants.BaseColor.point
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.cornerRadius = 30
        return button
        
    }()
    
       
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [tableView, weatherView, floatingButton].forEach {
            self.addSubview($0)
        }
      
    }
    
    override func setConstraints() {
        
        weatherView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(weatherView.snp.bottom).offset(0)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
 
    }
    
}
