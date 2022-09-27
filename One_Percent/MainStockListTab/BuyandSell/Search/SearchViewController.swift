//
//  SearchViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/26.
//

import UIKit

import JGProgressHUD
import SnapKit


class SearchViewController: BaseViewController {
    
    let hud = JGProgressHUD()
    
    var stockList: [StockNameModel] = []
    
    weak var delegate: SendStockDelegate?
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .plain)
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reusableIdentifier)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "종목명을 입력하세요."
        view.barStyle = .default
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func configureUI() {
        
        view.addSubview(tableView)
        view.addSubview(searchBar)
        
    }
    
    override func setConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom).offset(0)
        }
        
        
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reusableIdentifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.stockNameLabel.text = stockList[indexPath.row].stockName
        cell.stockMarketLabel.text = stockList[indexPath.row].stockMarket
        cell.stockNumberLabel.text = stockList[indexPath.row].stockNumber
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let stockNameData = stockList[indexPath.row].stockName
        
        delegate?.sendStockName(stockNameData)
        
        self.dismiss(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SearchViewController: UISearchBarDelegate {
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        hud.show(in: self.view)
        
        StockNameAPIManager.shared.getStockName(query: searchBar.text ?? "") { list in
            
            self.stockList = list
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.hud.dismiss(animated: true)
                self.dismisskeyboard()
            }
        }
    }
    
    func dismisskeyboard() {
        view.endEditing(true)
    }

}


