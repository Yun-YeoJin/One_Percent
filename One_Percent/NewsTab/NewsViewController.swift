//
//  NewsViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/13.
//

import UIKit

import Tabman
import Pageboy

final class NewsViewController: TabmanViewController {
    
    private var viewControllers = [DomesticNewsViewController(), GlobalNewsViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        // Create bar
        let bar = TMBar.TabBar()
       
        bar.backgroundColor = Constants.BaseColor.background
        bar.backgroundView.style = .blur(style: .regular)
        bar.buttons.customize { (button) in
            button.tintColor = .white
            button.selectedTintColor = Constants.BaseColor.point
        }
        
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .bottom)
        
        navigationItem.title = "경제 뉴스"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        navigationController?.navigationBar.tintColor = Constants.BaseColor.point
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        view.backgroundColor = Constants.BaseColor.background
       
    }

}

extension NewsViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
        case 0: return TMBarItem(title: "국내 증시", image: UIImage(systemName: "globe.asia.australia.fill")!)
        case 1: return TMBarItem(title: "세계 증시", image: UIImage(systemName: "globe.americas.fill")!)
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
        
      
    }
    
}




