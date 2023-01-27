//
//  BuyandSellView.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/19.
//

import UIKit

import Then
import SnapKit

final class BuyandSellView: BaseView {
    
    var selected = -1
    
    let contentLabel = BuyandSellLabel().then {
        $0.text = "종목명"
    }
    
    let contentSearchBar = UISearchBar().then {
        $0.placeholder = "종목명을 검색하세요."
        $0.barStyle = .default
    }
    
    let underBarView = UIView().then {
        $0.backgroundColor = Constants.BaseColor.text
        $0.layer.borderColor = Constants.BaseColor.border
    }
    
    let buyandsellLabel = BuyandSellLabel().then {
        $0.text = "매수 / 매도"
    }
    
    let buyButton = BuyandSellButtonView().then {
        $0.setTitle("매수(Buy)", for: .normal)
        $0.tag = 0
    }
    
    let sellButton = BuyandSellButtonView().then {
        $0.setTitle("매도(Sell)", for: .normal)
        $0.tag = 1
    }
    
    let stackview = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 10
    }
    
    let underBarView2 = UIView().then {
        $0.backgroundColor = Constants.BaseColor.text
        $0.layer.borderColor = Constants.BaseColor.border
    }
    
    let priceLabel = BuyandSellLabel().then {
        $0.text = "체결 단가"
        $0.adjustsFontSizeToFitWidth = true
    }
    
    let priceTextField = TextFieldView().then {

        $0.attributedPlaceholder = NSAttributedString(string: "체결 단가를 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])
        
    }
    
    let underBarView3 = UIView().then {
        $0.backgroundColor = Constants.BaseColor.text
        $0.layer.borderColor = Constants.BaseColor.border
    }
    
    let countLabel = BuyandSellLabel().then {
        $0.text = "수량 (주)"
    }
    
    let countTextField = TextFieldView().then {
        $0.attributedPlaceholder = NSAttributedString(string: "수량(주)를 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : Constants.BaseColor.placeholder])
        
    }
    
    let underBarView4 = UIView().then {
        $0.backgroundColor = Constants.BaseColor.text
        $0.layer.borderColor = Constants.BaseColor.border
    }
    
    let dateLabel = BuyandSellLabel().then {
        $0.text = "매매일자"
    }
    
    let dateDatePicker = UIDatePicker().then {
        $0.backgroundColor = Constants.BaseColor.background
        $0.preferredDatePickerStyle = .compact
        $0.locale = Locale(identifier: "ko_KR")
        $0.datePickerMode = .date
        $0.timeZone = TimeZone(identifier: "UTC+9")
    }
    
    let underBarView5 = UIView().then {
        $0.backgroundColor = Constants.BaseColor.text
        $0.layer.borderColor = Constants.BaseColor.border
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Constants.BaseColor.background
    }
    
    override func configureUI() {
        
        [contentLabel, contentSearchBar, underBarView, buyandsellLabel, stackview, underBarView2, priceLabel, priceTextField, underBarView3, countLabel, countTextField, underBarView4, dateLabel, dateDatePicker, underBarView5].forEach {
            self.addSubview($0)
            
            [buyButton, sellButton].forEach {
                self.stackview.addArrangedSubview($0)
            }
        }
        
        [buyButton, sellButton].forEach { sender in
            sender.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        }
        
        self.backgroundColor = Constants.BaseColor.background
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        
        [buyButton, sellButton].forEach { sender in
            sender.isSelected = false
            sender.backgroundColor = Constants.BaseColor.textField
        }
        sender.isSelected = true
        if sender.tag == 0 {
            sender.backgroundColor = .systemRed
        } else {
            sender.backgroundColor = .systemBlue
        }
    
        selected = sender.tag
       
    }
    
    override func setConstraints() {
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(50)
        }
        
        contentSearchBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(50)
            make.leadingMargin.equalTo(contentLabel.snp.trailing).offset(30)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        underBarView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(8)
            make.height.equalTo(1)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
        }
        
        buyandsellLabel.snp.makeConstraints { make in
            make.top.equalTo(underBarView.snp.bottom).offset(24)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(50)
        }
    
        stackview.snp.makeConstraints { make in
            make.top.equalTo(underBarView.snp.bottom).offset(24)
            make.leadingMargin.equalTo(buyandsellLabel.snp.trailing).offset(30)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        underBarView2.snp.makeConstraints { make in
            make.top.equalTo(buyandsellLabel.snp.bottom).offset(8)
            make.height.equalTo(1)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(underBarView2.snp.bottom).offset(24)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(50)
        }
        
        priceTextField.snp.makeConstraints { make in
            make.top.equalTo(underBarView2.snp.bottom).offset(24)
            make.leadingMargin.equalTo(priceLabel.snp.trailing).offset(30)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        underBarView3.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(8)
            make.height.equalTo(1)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(underBarView3.snp.bottom).offset(24)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(50)
        }
        
        countTextField.snp.makeConstraints { make in
            make.top.equalTo(underBarView3.snp.bottom).offset(24)
            make.leadingMargin.equalTo(countLabel.snp.trailing).offset(30)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        underBarView4.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(8)
            make.height.equalTo(1)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(underBarView4.snp.bottom).offset(24)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(50)
        }
        
        dateDatePicker.snp.makeConstraints { make in
            make.top.equalTo(underBarView4.snp.bottom).offset(24)
            make.leadingMargin.equalTo(dateLabel.snp.trailing).offset(30)
            make.trailingMargin.equalTo(-16)
            make.height.equalTo(50)
        }
        
        underBarView5.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.height.equalTo(1)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
        }
        
    }
}
