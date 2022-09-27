//
//  StockDetailViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/23.
//

import UIKit

class StockDetailViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .plain)
        view.register(StockTableViewCell.self, forCellReuseIdentifier: StockTableViewCell.reusableIdentifier)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Detail"
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
    }
    
    override func configureUI() {
        
        view.addSubview(tableView)
        
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension StockDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockTableViewCell.reusableIdentifier, for: indexPath) as? StockTableViewCell else { return UITableViewCell() }
    
            cell.iconImageView.image = UIImage(systemName: "plus.square.fill")
            cell.iconImageView.tintColor = .systemRed
            cell.stockNameLabel.text = "삼성전자"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    //MARK: TableViewHeader UI 설정
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView{
            //테이블뷰 헤더 UI 설정
            headerView.textLabel?.textColor = Constants.BaseColor.point
            headerView.textLabel?.font = .boldSystemFont(ofSize: 20)
            headerView.textLabel?.textAlignment = .left
        }
    }
    //헤더 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "주식 상세보기"
    }
}
