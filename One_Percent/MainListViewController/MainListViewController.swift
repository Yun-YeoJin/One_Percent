//
//  MainListViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/12.
//

import UIKit

import SnapKit
import Then
import SwiftUI

class MainListViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .insetGrouped)
        view.delegate = self
        view.dataSource = self
        view.register(MainListTableViewCell.self, forCellReuseIdentifier: MainListTableViewCell.reusableIdentifier)
        view.rowHeight = 70
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "SecondRun") == false {
            
            let vc = OnBoardingPageViewController()
            transition(vc, transitionStyle: .presentNavigation)
            
        }
    
        configureUI()
        setConstraints()
    }
    
    override func configureUI() {
        
        view.addSubview(tableView)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let calculateTab = UIBarButtonItem(image: UIImage(systemName: "x.squareroot"), style: .done, target: self, action: nil)
//        let mainListTab = UIBarButtonItem(image: UIImage(systemName: "doc.text.below.ecg"), style: .plain, target: self, action: nil)
        let chartPatternTab = UIBarButtonItem(image: UIImage(systemName: "chart.xyaxis.line"), style: .plain, target: self, action: nil)
        let newsTab = UIBarButtonItem(image: UIImage(systemName: "globe.asia.australia.fill"), style: .plain, target: self, action: #selector(newsTabClicked))

        toolbarItems = [spacer, calculateTab, spacer, chartPatternTab, spacer, newsTab, spacer]
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.tintColor = Constants.BaseColor.point
        navigationController?.toolbar.backgroundColor = Constants.BaseColor.background
        
    }
    
    @objc func newsTabClicked() {
        let vc = NewsViewController()
        transition(vc, transitionStyle: .push)
        
    }
    
    override func setConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
         
    }
    
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainListTableViewCell.reusableIdentifier, for: indexPath) as? MainListTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
}
