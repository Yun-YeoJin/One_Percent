//
//  OpenSourceLicense.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/28.
//

import UIKit

import Then
import SnapKit

class OpenSourceLicenseViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .plain)
        view.register(OpenSourceLicenseTableViewCell.self, forCellReuseIdentifier: OpenSourceLicenseTableViewCell.reusableIdentifier)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = Constants.BaseColor.background
        return view
    }()
    
    var opensourceData: [OpenSourceModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "오픈소스 라이선스"
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        
        opensourceData = OpenSourceInfo.OpenSource
    }
    
    override func configureUI() {
        
        view.addSubview(tableView)
        
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
}

extension OpenSourceLicenseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opensourceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OpenSourceLicenseTableViewCell.reusableIdentifier, for: indexPath) as? OpenSourceLicenseTableViewCell else { return UITableViewCell() }
        
        let data = opensourceData[indexPath.row]
        cell.opensourceNameLabel.text = data.name
        cell.opensourceURL.text = data.url
        cell.copyrightLabel.text = data.copyright
        cell.MITLicenseLabel.text = data.license
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
