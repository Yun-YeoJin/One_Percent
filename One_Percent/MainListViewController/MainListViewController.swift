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
    
    let mainView = MainListView()
  
    
    
    override func loadView() {
        self.view = mainView
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "SecondRun") == false {
            
            let vc = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        }
       
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(MainListTableViewCell.self, forCellReuseIdentifier: MainListTableViewCell.reusableIdentifier)
        configureUI()
        
        navigationItem.title = "윤기사의 매매일지"
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        
        
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationItem.rightBarButtonItems = [settingButton]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.star"), primaryAction: nil, menu: alignButtonClicked())
        
        mainView.floatingButton.addTarget(self, action: #selector(floatingButtonClicked), for: .touchUpInside)
    }
    
    @objc func floatingButtonClicked() {
        
           }
    
    @objc func settingButtonClicked() {
        
    }
    
    @objc func alignButtonClicked() -> UIMenu  {
        
        let sortContents = UIAction(title: "가나다순", image: UIImage(systemName: "abc")) { _ in
            
        }
        let sortCheckBox = UIAction(title: "수익률순", image: UIImage(systemName: "chart.line.uptrend.xyaxis")) { _ in
            
        }
        let sortFavorite = UIAction(title: "총 평가액순", image: UIImage(systemName: "dollarsign.circle")) { _ in
            
        }
        let menu = UIMenu(title: "목록 정렬하기", identifier: nil, options: .destructive, children: [sortContents, sortCheckBox, sortFavorite])
        
        return menu
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.floatingButton.frame = CGRect(x: view.frame.size.width-80, y: view.frame.size.height-170, width: 60, height: 60)
    }
    
    
    
    override func configureUI() {
                
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let calculateTab = UIBarButtonItem(image: UIImage(systemName: "x.squareroot"), style: .done, target: self, action: #selector(calculateTabClicked))
        let chartPatternTab = UIBarButtonItem(image: UIImage(systemName: "chart.xyaxis.line"), style: .plain, target: self, action: #selector(chartPatternTabClicked))
        let newsTab = UIBarButtonItem(image: UIImage(systemName: "globe.asia.australia.fill"), style: .plain, target: self, action: #selector(newsTabClicked))

        toolbarItems = [spacer, calculateTab, spacer, chartPatternTab, spacer, newsTab, spacer]
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.tintColor = Constants.BaseColor.point
        navigationController?.toolbar.backgroundColor = Constants.BaseColor.background
        
    }
    
    @objc func chartPatternTabClicked() {
        let vc = ChartPatternViewController()
        transition(vc, transitionStyle: .presentNavigation)
        
    }
    
    @objc func calculateTabClicked() {
        let vc = CaculateViewController()
        transition(vc, transitionStyle: .presentNavigation)
        
    }
    
    @objc func newsTabClicked() {
        let vc = NewsViewController()
        transition(vc, transitionStyle: .presentNavigation)
        
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
