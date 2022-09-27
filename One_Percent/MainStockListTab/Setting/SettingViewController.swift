//
//  SettingViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/22.
//

import UIKit
import MessageUI

class SettingViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .plain)
        view.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.reusableIdentifier)
        view.delegate = self
        view.dataSource = self
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
            return 1
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reusableIdentifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
                cell.iconImageView.image = UIImage(systemName: "bell.and.waveform")
                cell.settingLabel.text = "푸시 알림 설정"
        } else {
            if indexPath.row == 0 {
                cell.iconImageView.image = UIImage(systemName: "questionmark.circle")
                cell.settingLabel.text = "문의하기"
            } else if indexPath.row == 1 {
                cell.iconImageView.image = UIImage(systemName: "arrow.up.message")
                cell.settingLabel.text = "리뷰남기기"
            } else if indexPath.row == 2 {
                cell.iconImageView.image = UIImage(systemName: "iphone.homebutton.circle")
                cell.settingLabel.text = "버전 정보(Ver)"
                cell.versionLabel.text = "1.0"
            } else {
                cell.iconImageView.image = UIImage(systemName: "cube.transparent")
                cell.settingLabel.text = "오픈 소스 라이브러리"
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        } else {
            if indexPath.row == 0 { //문의하기
                sendEmail()
            } else if indexPath.row == 1 { //리뷰남기기
                
            }
        }
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
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "설정"
        } else {
            return "정보"
        }
    }
}

extension SettingViewController: MFMailComposeViewControllerDelegate {
    
    func sendEmail() {
        
        if MFMailComposeViewController.canSendMail() {
                let composeViewController = MFMailComposeViewController()
                composeViewController.mailComposeDelegate = self
                
                let bodyString = """
                                 이곳에 내용을 작성해주세요.
                                 
                                 오타 발견 문의 시 아래 양식에 맞춰 작성해주세요.
                                 
                                 <예시>
                                 오타 발견 탭 : 차트패턴 탭
                                 수정 전 : 하락 가능성이 놉습니다.
                                 수정 후 : 하락 가능성이 높습니다.
                                 
                                 -------------------
                                 
                                 Device Model : \(self.getDeviceIdentifier())
                                 Device OS : \(UIDevice.current.systemVersion)
                                 App Version : \(self.getCurrentVersion())
                                 
                                 -------------------
                                 """
                
                composeViewController.setToRecipients(["duwls0349@naver.com"])
                composeViewController.setSubject("<One Percent> 문의 및 의견")
                composeViewController.setMessageBody(bodyString, isHTML: false)
                
                self.present(composeViewController, animated: true, completion: nil)
            } else {
                print("메일 보내기 실패")
                let sendMailErrorAlert = UIAlertController(title: "메일 전송 실패", message: "메일을 보내려면 'Mail' 앱이 필요합니다. App Store에서 해당 앱을 복원하거나 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
                let goAppStoreAction = UIAlertAction(title: "App Store로 이동하기", style: .default) { _ in
                    // 앱스토어로 이동하기(Mail)
                    if let url = URL(string: "https://apps.apple.com/kr/app/mail/id1108187098"), UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                }
                let cancleAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)
                
                sendMailErrorAlert.addAction(goAppStoreAction)
                sendMailErrorAlert.addAction(cancleAction)
                self.present(sendMailErrorAlert, animated: true, completion: nil)
            }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            self.dismiss(animated: true, completion: nil)
        }
    
    func getDeviceIdentifier() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }

    // 현재 버전 가져오기
    func getCurrentVersion() -> String {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String else { return "" }
        return version
    }
    
}
