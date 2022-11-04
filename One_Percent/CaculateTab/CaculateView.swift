//
//  CaculateView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit

import SnapKit
import Then

final class CaculateView: BaseView {
    
    var selected = -1 // 0을 넣으면 tag값이 있기 때문에 나올 수 없는 값을 넣어줌.
    
    let moneyLabel = calculateLabel().then {
        $0.text = "원금(₩)"
    }
    
    let moneyTextField = TextFieldView().then {
        
        $0.attributedPlaceholder = NSAttributedString(string: "원금을 입력하세요. ex) 100,000", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])    }
    
    let rateLabel = calculateLabel().then {
        $0.text = "이자율(%)"
    }
    
    let rateTextField = TextFieldView().then {
        $0.attributedPlaceholder = NSAttributedString(string: "이자율을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])
    }
    
    let dateLabel = calculateLabel().then {
        $0.text = "투자 기간"
    }
    
    let dateTextField = TextFieldView().then {
        $0.attributedPlaceholder = NSAttributedString(string: "투자 기간을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])
    }
    
    let caculateLabel = calculateLabel().then {
        $0.text = "복리 계산 단위 선택"
    }
    
    let yearCaculateButton = CalculateButtonView().then {
        $0.setTitle("연 복리", for: .normal)
        $0.tag = 0
    }
    
    let monthCaculateButton = CalculateButtonView().then {
        $0.setTitle("월 복리", for: .normal)
        $0.tag = 1
    }
    
    let dayCaculateButton = CalculateButtonView().then {
        $0.setTitle("일 복리", for: .normal)
        $0.tag = 2
    }
    
    let stackview = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 5
    }
    
    
    let resultLabel = calculateLabel().then {
        $0.text = "복리 계산 결과"
    }
    
    let resultView = UIView().then {
        $0.backgroundColor = Constants.BaseColor.textField
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
    }
    
    let resultViewLabel = UILabel().then {
        $0.text = "과연 얼마가 나올까요!?"
        $0.textColor = Constants.BaseColor.text
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureUI() {
        [moneyLabel, moneyTextField, rateLabel, rateTextField, dateLabel, dateTextField, caculateLabel, stackview, resultLabel, resultView, resultViewLabel].forEach {
            self.addSubview($0)
            
            [yearCaculateButton, monthCaculateButton, dayCaculateButton].forEach {
                self.stackview.addArrangedSubview($0)
            }
        }
        
        [yearCaculateButton, monthCaculateButton, dayCaculateButton].forEach { sender in
            sender.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        }
        
        self.backgroundColor = Constants.BaseColor.background
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        
        [yearCaculateButton, monthCaculateButton, dayCaculateButton].forEach { sender in
            sender.isSelected = false
            sender.backgroundColor = Constants.BaseColor.textField
        }
        sender.isSelected = true
        sender.backgroundColor = .systemTeal
        
        selected = sender.tag
        
        if selected == 0 {
            dateLabel.text = "투자 기간 (연 복리)"
        } else if selected == 1 {
            dateLabel.text = "투자 기간 (월 복리)"
        } else if selected == 2 {
            dateLabel.text = "투자 기간 (일 복리)"
        } else {
            dateLabel.text = "투자 기간"
        }
    }
    
    override func setConstraints() {
        
        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
        moneyTextField.snp.makeConstraints { make in
            make.top.equalTo(moneyLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(moneyTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
        rateTextField.snp.makeConstraints { make in
            make.top.equalTo(rateLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        caculateLabel.snp.makeConstraints { make in
            make.top.equalTo(rateTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
        stackview.snp.makeConstraints { make in
            make.top.equalTo(caculateLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(50)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(stackview.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(24)
        }
        
        resultView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(50)
        }
        
        resultViewLabel.snp.makeConstraints { make in
            make.top.equalTo(resultView.snp.top).offset(8)
            make.leading.equalTo(resultView.snp.leading).offset(8)
            make.bottom.equalTo(resultView.snp.bottom).offset(-8)
            make.trailing.equalTo(resultView.snp.trailing).offset(-8)
            
        }
    }
}
