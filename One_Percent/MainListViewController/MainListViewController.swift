//
//  MainListViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/12.
//

import UIKit
import CoreLocation

import SnapKit
import Then
import SwiftUI
import Kingfisher


class MainListViewController: BaseViewController {
    
    let mainView = MainListView()
    
    let locationManager = CLLocationManager()
    
    var myLocation: CLLocationCoordinate2D?
    
    static let identifier = "MainListViewController"
    
    let notificationCenter = UNUserNotificationCenter.current()
    
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
        
        navigationItem.title = "매매일지"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        
        
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationItem.rightBarButtonItems = [settingButton]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.star"), primaryAction: nil, menu: alignButtonClicked())
        
        mainView.floatingButton.addTarget(self, action: #selector(floatingButtonClicked), for: .touchUpInside)
        
        weatherAPI()
        requestAuthorization()
        sendNotification()
    }
    
    //MARK: Notification 설정
    
    func requestAuthorization () {
        
        let autorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        notificationCenter.requestAuthorization(options: autorizationOptions) { success, error in
            if success {
                
                self.sendNotification()
            }
        }
    }
    
    func sendNotification() {
        
        // 콘텐트
        let notificationContent = UNMutableNotificationContent() // mutable 없으면 get-only임
        
        notificationContent.title = "⏰ 국내장이 개장했어요!"
        //notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...45))"
        notificationContent.body = "나만의 매매일지를 작성해볼까요?"
        notificationContent.badge = 1
        
        // 트리거 : 1. 시간간격 2. 캘린더 3. 위치에 따라 설정 가능
        // 시간간격 : 60초 이상 설정해야 반복 가능하다.
        // 하루에 한번이면 86400
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // 트리거 - 캘린더
        var dateComponent = DateComponents()
        dateComponent.hour = 9
        
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger2)
        
        notificationCenter.add(request)
        
    }
    
    func weatherAPI() {
        
        WeatherAPIManager.shared.getWeatherData(lat: 37.65128, lon: 127.08335) { value in
            
            let url = URL(string: "https://openweathermap.org/img/wn/\(value.iconId)@2x.png")
            self.mainView.weatherImageView.kf.setImage(with: url)
            
            self.mainView.currentTempLabel.text = value.temperatureText
            self.mainView.maxminTempLabel.text = value.maxMinText
            self.mainView.windLabel.text = value.windText
            self.mainView.humidityLabel.text = value.humidityText
            self.mainView.pressureLabel.text = value.pressureText
            self.mainView.messageLabel.text = WeatherModel.getMessage(weather: value.weather)
            
        }
        
    }
    
    @objc func floatingButtonClicked() {
        
        let vc = BuyandSellViewController()
        transition(vc, transitionStyle: .push)
        
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

//MARK: 사용자 위치 설정

extension MainListViewController: CLLocationManagerDelegate {
    
    func checkUserDeviceLocationServiceAuthorization() {
        
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            //인스턴스를 통해 locationManager가 가지고 있는 상태를 가져옴.
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        //iOS 위치 서비스 활성화 여부 체크: locationServicesEnabled
        if CLLocationManager.locationServicesEnabled() {
            //위치 서비스가 활성화 되어 있음 => 위치 권한 요청 가능 => 위치 권한을 요청
            checkUserCurrentLocationAuthorization(authorizationStatus)
        } else {
            print("위치 서비스가 꺼져 있어 위치 권한 요청이 불가합니다.")
        }
        
    }
    
    func checkUserCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
            
        case .notDetermined:
            print("NOTDETERMINED")
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted, .denied:
            print("DENIED, 아이폰 설정으로 유도")
            
        case .authorizedWhenInUse:
            print("WHEN IN USE")
            
            locationManager.startUpdatingLocation()
            
        default:
            print("DEFAULT")
        }
    }
    
    
    
    func showRequestLocationServiceAlert() {
        
        let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
            
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
            
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        requestLocationServiceAlert.addAction(cancel)
        requestLocationServiceAlert.addAction(goSetting)
        
        present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        checkUserDeviceLocationServiceAuthorization()
        
    }
    
}
