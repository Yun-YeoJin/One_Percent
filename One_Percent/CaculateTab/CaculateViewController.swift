//
//  CaculateViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit

class CaculateViewController: BaseViewController {
    
    let mainView = CaculateView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "일 복리 계산기"
        navigationController?.navigationBar.tintColor = .systemMint
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "계산하기", style: .plain, target: self, action: #selector(caculateButtonClicked))
        
    }
    
    @objc func caculateButtonClicked() {
        
    }
    
    override func configureUI() {
        
    }
    
    override func setConstraints() {
        
    }
    
}
