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
import RealmSwift

class MainListViewController: BaseViewController {
    
    let mainView = MainListView()
    
    let locationManager = CLLocationManager()
    
    var lat: Double = 37.517829
    var lon: Double = 126.886270
    
    var myLocation = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
    
    static let identifier = "MainListViewController"
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    let config = Realm.Configuration(schemaVersion: 1)
    
    lazy var localRealm = try! Realm(configuration: config)
    
    let repository = StockRepository()
    
    var tasks: Results<Stock>! {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestRealm()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        checkLocationServiceAuthorizationStatus()
        
        if UserDefaults.standard.bool(forKey: "SecondRun") == false {
            
            let vc = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        }
        
        tasks = localRealm.objects(Stock.self)
        
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
        
        requestAuthorization()
        sendNotification()
        
        StockNameAPIManager.shared.getStockName(query: "삼성전자") { list in
            print(list)
        }
        
    }
    
    @objc func floatingButtonClicked() {
        
        let vc = BuyandSellViewController()
        transition(vc, transitionStyle: .presentFullNavigation)
        
    }
    
    @objc func settingButtonClicked() {
        
        let vc = SettingViewController()
        transition(vc, transitionStyle: .push)
        
    }
    
    @objc func alignButtonClicked() -> UIMenu  {
        
        let sortName = UIAction(title: "가나다순", image: UIImage(systemName: "abc")) { _ in
            self.tasks = self.localRealm.objects(Stock.self).sorted(byKeyPath: "stockName")
        }
        let sortLargeQuantity = UIAction(title: "수량(주) 많은순", image: UIImage(systemName: "chart.bar.fill")) { _ in
            self.tasks = self.localRealm.objects(Stock.self).sorted(byKeyPath: "stockQuantity", ascending: false)
        }
        
        let sortSmallQuantity = UIAction(title: "수량(주) 적은순", image: UIImage(systemName: "chart.bar")) { _ in
            self.tasks = self.localRealm.objects(Stock.self).sorted(byKeyPath: "stockQuantity", ascending: true)
        }
        
        let sortCurrentDate = UIAction(title: "매매일자 최신순", image: UIImage(systemName: "calendar.badge.plus")) { _ in
            self.tasks = self.localRealm.objects(Stock.self).sorted(byKeyPath: "stockDate", ascending: false)
        }
        
        let sortOlderDate = UIAction(title: "매매일자 오래된순", image: UIImage(systemName: "calendar.badge.minus")) { _ in
            self.tasks = self.localRealm.objects(Stock.self).sorted(byKeyPath: "stockDate", ascending: true)
        }
        let menu = UIMenu(title: "목록 정렬하기", identifier: nil, options: .destructive, children: [sortName, sortLargeQuantity, sortSmallQuantity, sortCurrentDate, sortOlderDate])
        
        return menu
        
    }
    
    func requestRealm() {
        tasks = repository.fetch()
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
        
        // Contents
        let notificationContent = UNMutableNotificationContent() // mutable 없으면 get-only임
        
        notificationContent.title = "⏰ 국내장이 개장했어요!"
        //notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...45))"
        notificationContent.body = "나만의 매매일지를 작성해볼까요?"
        notificationContent.badge = 1
        
        // 트리거 : 1. 시간간격 2. 캘린더 3. 위치에 따라 설정 가능
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // 트리거 - 캘린더
        var dateComponent = DateComponents()
        dateComponent.hour = 9
        
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger2)
        
        notificationCenter.add(request)
        
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

//MARK: 매매일지 TableView 설정

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainListTableViewCell.reusableIdentifier, for: indexPath) as? MainListTableViewCell else { return UITableViewCell() }
    
        cell.stockNameLabel.text = tasks[indexPath.row].stockName
        cell.stockPriceLabel.text = "체결 단가 : " + String((tasks[indexPath.row].stockPrice).withCommas()) + "원"
        cell.stockQuantityLabel.text = "수량(주) : " +  String((tasks[indexPath.row].stockQuantity).withCommas()) + "주"
        cell.totalPriceLabel.text = "총 평가액 : " + String((tasks[indexPath.row].stockPrice * tasks[indexPath.row].stockQuantity).withCommas()) + "원"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = StockDetailViewController()
        transition(vc, transitionStyle: .present)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "삭제") { action, view, completionHandler in
            
            self.repository.deleteItem(self.tasks[indexPath.row])
        
            self.requestRealm()
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }

}


//MARK: 사용자 위치 설정

extension MainListViewController {
    
    func checkLocationServiceAuthorizationStatus() {
        
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorizationStatus(authorizationStatus)
        } else {
            print("위치 권한 확인하세요.")
        }
    }
    
    func checkCurrentLocationAuthorizationStatus(_ authorizationStatus: CLAuthorizationStatus) {
        
        switch authorizationStatus {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted, .denied:
            
            showRequestLocationServiceAlert()
            
        case .authorizedWhenInUse:
            
            AddressAPIManager.shared.getLocationData(lat: lat, lon: lon) { value in
                self.mainView.locationLabel.text = "\(value.regionFirst)"
                
                WeatherAPIManager.shared.getWeatherData(lat: self.lat, lon: self.lon) { value in
                    //첫번째 뷰
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
            
            locationManager.startUpdatingLocation()
        default:
            print("항상 허용")
        }
    }
    func showRequestLocationServiceAlert() {
        let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
            
            //설정페이지로 가는링크
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        requestLocationServiceAlert.addAction(cancel)
        requestLocationServiceAlert.addAction(goSetting)
        
        present(requestLocationServiceAlert, animated: true, completion: nil)
    }
}
    
extension MainListViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                
        if let coordinate = locations.last?.coordinate {
            lat = coordinate.latitude
            lon = coordinate.longitude
            
            myLocation = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            
            AddressAPIManager.shared.getLocationData(lat: lat, lon: lon) { value in
                self.mainView.locationLabel.text = "\(value.regionFirst), \(value.regionSecond)"
                
                WeatherAPIManager.shared.getWeatherData(lat: self.lat, lon: self.lon) { value in
                    
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
        }
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationServiceAuthorizationStatus()
    }
    
}
