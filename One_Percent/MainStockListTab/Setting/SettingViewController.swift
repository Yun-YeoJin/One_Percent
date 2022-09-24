//
//  SettingViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/22.
//

import UIKit

class SettingViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .plain)
        view.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.reusableIdentifier)
        view.delegate = self
        view.dataSource = self
        view.rowHeight = 40
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "설정하기"
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

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reusableIdentifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.iconImageView.image = UIImage(systemName: "bell.and.waveform.fill")
                cell.settingLabel.text = "푸시 알림 설정"
            } else if indexPath.row == 1 {
                cell.iconImageView.image = UIImage(systemName: "arrow.counterclockwise.icloud")
                cell.settingLabel.text = "초기화"
            }
            
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.iconImageView.image = UIImage(systemName: "speaker.badge.exclamationmark")
                cell.settingLabel.text = "공지사항"
            } else if indexPath.row == 1 {
                cell.iconImageView.image = UIImage(systemName: "iphone.homebutton.circle")
                cell.settingLabel.text = "버전 정보(Ver)"
            } else {
                cell.iconImageView.image = UIImage(systemName: "cube.transparent")
                cell.settingLabel.text = "오픈 소스 라이브러리"
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
        return 70
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "설정하기"
        } else {
            return "정보"
        }
    }
}
