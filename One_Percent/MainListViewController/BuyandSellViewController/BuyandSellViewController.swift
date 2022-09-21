//
//  BuyandSellViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/19.
//

import UIKit

class BuyandSellViewController: BaseViewController {
    
  
    let mainView = BuyandSellView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func configureUI() {
        
        navigationItem.title = "매매일지 추가하기"
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장하기", style: .done, target: .none, action: #selector(saveButtonClicked))
        
    }
    
    @objc func saveButtonClicked() {
        
    }

        
}
