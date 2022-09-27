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
        let view = UITableView.init(frame: .zero, style: .plain)
        view.register(MainListTableViewCell.self, forCellReuseIdentifier: MainListTableViewCell.reusableIdentifier)
        view.rowHeight = 140
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
    
    let weatherView = UIImageView().then {
        $0.image = UIImage(named: "backgroundImage")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.alpha = 0.7
    }
    
    let locationImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.image = UIImage(systemName: "location.circle")
        $0.tintColor = Constants.BaseColor.point
    }
    
    let locationLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 20)
        $0.text = "위치"
    }
    
    let weatherBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.alpha = 0.5
        $0.layer.cornerRadius = 20
    }
    
    let weatherImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.contentMode = .scaleAspectFill
    }
    
    let currentTempLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 15)
        $0.text = "현재온도"
    }
    
    let maxminTempLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 15)
        $0.text = "최소최저온도"
    }
    
    let windLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 15)
        $0.text = "바람세기"
    }
    let humidityLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 15)
        $0.text = "습도"
    }
    let pressureLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 15)
        $0.text = "기압"
    }
    let messageLabel = UILabel().then {
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 15)
        $0.text = "메시지"
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
        [locationImageView, locationLabel, weatherBackgroundView, weatherImageView, currentTempLabel, maxminTempLabel, windLabel, humidityLabel, pressureLabel, messageLabel].forEach {
            self.addSubview($0)
        }
      
    }
    
    override func setConstraints() {
        
        weatherView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.28)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.top.equalTo(weatherView.snp.top).offset(16)
            make.leading.equalTo(weatherView.snp.leading).offset(16)
            make.height.width.equalTo(30)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherView.snp.top).offset(16)
            make.leading.equalTo(locationImageView.snp.trailing).offset(8)
            make.height.equalTo(30)
        }
        
        weatherBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(weatherView.snp.top).offset(16)
            make.trailing.equalTo(weatherView.snp.trailing).offset(-16)
            make.width.height.equalTo(110)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalTo(weatherView.snp.top).offset(16)
            make.trailing.equalTo(weatherView.snp.trailing).offset(-16)
            make.width.height.equalTo(110)
        }
        
        currentTempLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.leading.equalTo(weatherView.snp.leading).offset(16)
            make.height.equalTo(30)
        }
        
        maxminTempLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.leading.equalTo(currentTempLabel.snp.trailing).offset(8)
            make.height.equalTo(30)
        }
        
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(currentTempLabel.snp.bottom).offset(16)
            make.leading.equalTo(weatherView.snp.leading).offset(16)
            make.height.equalTo(20)
        }
        
        humidityLabel.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(8)
            make.leading.equalTo(weatherView.snp.leading).offset(16)
            make.height.equalTo(20)
        }
        
        pressureLabel.snp.makeConstraints { make in
            make.top.equalTo(humidityLabel.snp.bottom).offset(8)
            make.leading.equalTo(weatherView.snp.leading).offset(16)
            make.height.equalTo(20)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherBackgroundView.snp.bottom).offset(36)
            make.leading.equalTo(pressureLabel.snp.trailing).offset(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(weatherView.snp.bottom).offset(0)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
 
    }
    
}
