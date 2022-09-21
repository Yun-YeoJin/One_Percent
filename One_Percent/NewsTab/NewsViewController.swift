//
//  NewsViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/13.
//

import UIKit
import SafariServices

import SnapKit
import Then

class NewsViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .insetGrouped)
        view.delegate = self
        view.dataSource = self
        view.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reusableIdentifier)
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
  
    var domesticNewsList: [NewsModel] = []
    var globalNewsList: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "경제 뉴스"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        navigationController?.navigationBar.tintColor = Constants.BaseColor.point
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.triangle.2.circlepath"), style: .plain, target: self, action: #selector(refreshButtonClicked))
        
        NewsAPIManager.shared.requestNewsData(query: "국내증시", startPage: Int.random(in: 1...30)) { list in
            DispatchQueue.main.async {
                self.domesticNewsList = list
                self.tableView.reloadData()
            }
        }
        NewsAPIManager.shared.requestNewsData(query: "세계증시", startPage: Int.random(in: 1...30)) { list in
            DispatchQueue.main.async {
                self.globalNewsList = list
                self.tableView.reloadData()
            }
        }
     }
    
    @objc func refreshButtonClicked() {
        
        NewsAPIManager.shared.requestNewsData(query: "국내증시", startPage: Int.random(in: 1...30)) { list in
            DispatchQueue.main.async {
                self.domesticNewsList = list
                self.tableView.reloadData()
            }
        }
        NewsAPIManager.shared.requestNewsData(query: "세계증시", startPage: Int.random(in: 1...30)) { list in
            DispatchQueue.main.async {
                self.globalNewsList = list
                self.tableView.reloadData()
            }
        }
        
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? domesticNewsList.count : globalNewsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reusableIdentifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.titleLabel.text = String(htmlEncodedString: "\(domesticNewsList[indexPath.row].title)")!
            cell.pubDateLabel.text = domesticNewsList[indexPath.row].pubDate.toDate()?.toString()
            
        } else {
            cell.titleLabel.text = String(htmlEncodedString: "\(globalNewsList[indexPath.row].title)")!
            cell.pubDateLabel.text = globalNewsList[indexPath.row].pubDate.toDate()?.toString()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let url = URL(string: domesticNewsList[indexPath.row].link) else {
            return
        }
        
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true)
        
    }
    //MARK: TableViewHeader UI 설정
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView{
            //테이블뷰 헤더 UI 설정
            headerView.textLabel?.textColor = Constants.BaseColor.point
            headerView.textLabel?.font = UIFont(name: "ChosunKm", size: 30)
            headerView.textLabel?.textAlignment = .center
    
        }
    }
    
    //헤더 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "* 국내 증시 *"
        } else {
            return "* 세계 증시 *"
        }
    }
}



