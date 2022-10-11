//
//  OnBoardingPageViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/10.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {

    //let notificationCenter = UNUserNotificationCenter.current()
    
    let button: UIButton = {
        let view = UIButton()
        view.setTitle("시작하기", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = Constants.BaseColor.point
        view.layer.cornerRadius = Constants.Design.cornerRadius
        return view
    }()
    
    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    let startindex = 0
    
    var currentindex = 0 { //currentindex -> startindex
        didSet {
            pageControl.currentPage = currentindex
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
        self.makePageControl()
        
        //requestAuthorization()
       
    }
    
    //MARK: Notification 설정
    
//    func requestAuthorization () {
//
//        let autorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
//
//        notificationCenter.requestAuthorization(options: autorizationOptions) { success, error in
//            if success {
//
//                self.sendNotification()
//            }
//        }
//    }
//
//    func sendNotification() {
//
//        // Contents
//        let notificationContent = UNMutableNotificationContent() // mutable 없으면 get-only임
//
//        notificationContent.title = "⏰ 오늘도 1% 잊지 않으셨죠!?"
//        //notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...45))"
//        notificationContent.body = "나만의 매매일지를 작성해볼까요?"
//        notificationContent.badge = 1
//
//        // 트리거 : 1. 시간간격 2. 캘린더 3. 위치에 따라 설정 가능
//        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//        // 트리거 - 캘린더
//        var dateComponent = DateComponents()
//        dateComponent.hour = 9
//
//        let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
//
//        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger2)
//
//        notificationCenter.add(request)
//
//    }
    
    func makePageVC() {
        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC1.start = "1% 시작하기"
        itemVC1.startImage = UIImage(named: "banner01")
        itemVC1.mainTitle = "하루의 시작을 1%와 함께하세요."
        itemVC1.desrcription = """
        
        하루 1%의 수익률을 기록할 때,
        
        365일 후엔 약 38배의 수익을 얻을 수 있습니다.
        
        """
        
        let itemVC2 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC2.start = "1% 시작하기"
        itemVC2.startImage = UIImage(named: "banner02")
        itemVC2.mainTitle = "나만의 매매일지를 기록하세요."
        itemVC2.desrcription = """
        
        자신만의 주식 매매일지를
        
        기록하고 관리해보세요.
        
        """
        
        let itemVC3 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC3.start = "1% 시작하기"
        itemVC3.startImage = UIImage(named: "banner03")
        itemVC3.mainTitle = "경제뉴스도 틈틈히 확인하세요."
        itemVC3.desrcription = """

        시시각각 바뀌는 증시 상황을

        가장 빠르게 확인해보세요.

        """
        
        //itemVC1, VC2, VC3 를 pages 배열에 넣어주기
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        //pageViewController 시작 페이지 설정하기.
        setViewControllers([itemVC1], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
        
        
    }
    
    func makePageControl() {
        
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        pageControl.currentPageIndicatorTintColor = Constants.BaseColor.point //선택된 점의 페이지 색깔
        pageControl.pageIndicatorTintColor = .lightGray //선택 안된 점의 색깔
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startindex //현재 페이지
        
        pageControl.isUserInteractionEnabled = true //모든 터치와 관련된 이벤트는 동작하지 않는다!
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    //페이지컨트롤의 누른 페이지 내용을 보여주기!
    @objc func pageControlTapped(sender: UIPageControl) {
        
        if sender.currentPage > self.currentindex { // 1페이지에서 2페이지로 간다면
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        self.currentindex = sender.currentPage //누른 페이지를 기억해야한다.
        buttonPresentationStyle()
    }
    
    //버튼 코드로 만들기.
    func makeBottomButton() {
     
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
   
        //버튼 Constratints 코드로 설정하기!
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomButtonMargin?.isActive = true
        
        hideButton() // 초기화면에 숨겨놔야함.
    }
    
    @objc func dismissPageVC() {
        
        self.dismiss(animated: true)
        UserDefaults.standard.set(true, forKey: "SecondRun")
        
    }
}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    //PageView를 구현하기 위해 해야하는 것,
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentindex = pages.firstIndex(of: viewController) else {
            return nil
        }
        //firstindex = 찾으면 끝나는 것.
        //해당되는 값이 몇번 index인지 알려줌. //옵셔널값이라 guard let
        self.currentindex = currentindex //현재 페이지 알려주기
        if currentindex == 0 {
            return pages.last
        } else {
            return pages[currentindex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentindex = pages.firstIndex(of: viewController) else {
            return nil
        }
        self.currentindex = currentindex //현재 페이지 알려주기
        if currentindex == pages.count - 1 //마지막 index가 맞으면
        {
            return nil
        } else {
            return pages[currentindex + 1]
        }
        
    }
}

extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else { //0번째 인덱스
            return
        }
        guard let currentindex = pages.firstIndex(of: currentVC) else {
            return
        }
        self.currentindex = currentindex
        buttonPresentationStyle()
        
    }
    
    func buttonPresentationStyle() {
        if currentindex == pages.count - 1 { // 마지막 index가 맞으면!
            // 버튼 보여야함
            self.showButton()
        } else {
            // 버튼 숨겨야함
            self.hideButton()
        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.view.layoutIfNeeded()
        }
    }
    
    func showButton() {
        bottomButtonMargin?.constant = -10
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
}

