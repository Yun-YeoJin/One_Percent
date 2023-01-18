//
//  OnBoardingItemViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/12.
//

import UIKit

final class OnBoardingItemViewController: UIViewController {

    var start = ""
    var mainTitle = ""
    var desrcription = ""
    var startImage: UIImage? = UIImage()
    
    
    @IBOutlet weak var startLabel: UILabel! {
        didSet {
            startLabel.textColor = Constants.BaseColor.point
            startLabel.textAlignment = .left
            
        }
    }
    
    @IBOutlet weak var startImageView: UIImageView!
    
    @IBOutlet weak var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.textColor = .label
          
        }
    }
    @IBOutlet weak var desrcriptionLabel: UILabel! {
        didSet {
            desrcriptionLabel.textColor = .label
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startLabel.text = start
        startImageView.image = startImage
        mainTitleLabel.text = mainTitle
        desrcriptionLabel.text = desrcription
        
        startLabel.font = UIFont(name: "VITRO CORE TTF", size: 25)
        mainTitleLabel.font = UIFont(name: "VITRO CORE TTF", size: 20)
        desrcriptionLabel.font = UIFont(name: "VITRO PRIDE TTF", size: 17)
       
    }


    

}
