//
//  CaculateView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit

import SnapKit
import Then

class CaculateView: BaseView {
    
    let moneyLabel = UILabel().then {
        $0.text = "원금"
        $0.textColor = Constants.BaseColor.text
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .left
    }
    
    let moneyTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "원금을 입력하세요. ex) 100,000", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])
        $0.backgroundColor = Constants.BaseColor.textField
        $0.layer.cornerRadius = 25
        $0.textAlignment = .center
    }
    
    let rateLabel = UILabel().then {
        $0.text = "이자율(%)"
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .left
    }
    
    let rateTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "이자율을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])
        $0.backgroundColor = Constants.BaseColor.textField
        $0.layer.cornerRadius = 25
        $0.textAlignment = .center
    }
    
    let dateLabel = UILabel().then {
        $0.text = "투자 기간"
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .left
    }
    
    let dateTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "투자 기간을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])
        $0.backgroundColor = Constants.BaseColor.textField
        $0.layer.cornerRadius = 25
        $0.textAlignment = .center
    }
    
    let caculateLabel = UILabel().then {
        $0.text = "복리 계산 단위 선택"
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .left
    }
    
    let yearCaculateButton = UIButton().then {
        $0.setTitleColor(Constants.BaseColor.placeholder, for: .normal)
        $0.setTitle("연 복리", for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = Constants.BaseColor.border
        $0.backgroundColor = Constants.BaseColor.textField
    }
    
    let monthCaculateButton = UIButton().then {
        $0.setTitleColor(Constants.BaseColor.placeholder, for: .normal)
        $0.setTitle("월 복리", for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = Constants.BaseColor.border
        $0.backgroundColor = Constants.BaseColor.textField
    }
    
    let dayCaculateButton = UIButton().then {
        $0.setTitleColor(Constants.BaseColor.placeholder, for: .normal)
        $0.setTitle("일 복리", for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = Constants.BaseColor.border
        $0.backgroundColor = Constants.BaseColor.textField
    }
    
    let stackview = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 5
    }
    
    let resultLabel = UILabel().then {
        $0.text = "복리 계산 결과"
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .left
    }
    
    let resultView = UIView().then {
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
    }
    
    let resultViewLabel = UILabel().then {
        $0.text = "여기에 계산 결과"
        $0.textColor = .darkGray
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [moneyLabel, moneyTextField, rateLabel, rateTextField, dateLabel, dateTextField, caculateLabel, stackview, resultLabel, resultView, resultViewLabel].forEach {
            self.addSubview($0)
            
            [yearCaculateButton, monthCaculateButton, dayCaculateButton].map {
                self.stackview.addArrangedSubview($0)
            }
        }
        self.backgroundColor = Constants.BaseColor.background
    }
    
    override func setConstraints() {
        
        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(24)
        }
        
        moneyTextField.snp.makeConstraints { make in
            make.top.equalTo(moneyLabel.snp.bottom).offset(16)
            make.leadingMargin.equalTo(16)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(moneyTextField.snp.bottom).offset(30)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(24)
        }
        
        rateTextField.snp.makeConstraints { make in
            make.top.equalTo(rateLabel.snp.bottom).offset(16)
            make.leadingMargin.equalTo(16)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(rateTextField.snp.bottom).offset(30)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(24)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.leadingMargin.equalTo(16)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        caculateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(30)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(24)
        }
        
        stackview.snp.makeConstraints { make in
            make.top.equalTo(caculateLabel.snp.bottom).offset(8)
            make.leadingMargin.equalTo(12)
            make.trailingMargin.equalTo(-12)
            make.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(stackview.snp.bottom).offset(50)
            make.leadingMargin.equalTo(12)
            make.trailingMargin.equalTo(-12)
            make.height.equalTo(24)
        }
        
        resultView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(8)
            make.leadingMargin.equalTo(12)
            make.trailingMargin.equalTo(-12)
            make.height.equalTo(60)
        }
        
        resultViewLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(resultView.safeAreaLayoutGuide)
            make.height.equalTo(30)
        }
    }
}