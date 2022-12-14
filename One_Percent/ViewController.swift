//
//  ViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/10.
//

import UIKit

class ViewController: UIViewController {
    
    var didShowOnboardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        
        pageVC.modalPresentationStyle = .fullScreen //전체화면으로 표시
        
        self.present(pageVC, animated: true, completion: nil)
        
    }
    
}

