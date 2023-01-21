//
//  ChartDetailViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/18.
//

import UIKit

final class ChartDetailViewController: BaseViewController {
    
    private let mainView = ChartDetailView()
    
    var patternData: PatternsModel?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.BaseColor.background
        
        mainView.titleLabel.text = patternData?.title
        mainView.chartImageView.image = UIImage(named: patternData!.imageName)
        mainView.descriptionLabel.text = patternData?.description
        
    }
    
}
