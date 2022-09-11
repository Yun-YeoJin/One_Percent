//
//  OnBoardingItemViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/12.
//

import UIKit

class OnBoardingItemViewController: UIViewController {

    var start = ""
    var mainTitle = ""
    var desrcription = ""
    var startImage: UIImage? = UIImage()
    
    
    @IBOutlet weak var startLabel: UILabel! {
        didSet {
            startLabel.textColor = Constants.BaseColor.point
            startLabel.textAlignment = .left
            startLabel.font = .boldSystemFont(ofSize: 25)
        }
    }
    
    @IBOutlet weak var startImageView: UIImageView!
    
    @IBOutlet weak var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.textColor = .label
            mainTitleLabel.font = .boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var desrcriptionLabel: UILabel! {
        didSet {
            desrcriptionLabel.textColor = .label
            desrcriptionLabel.font = .systemFont(ofSize: 18)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startLabel.text = start
        startImageView.image = startImage
        mainTitleLabel.text = mainTitle
        desrcriptionLabel.text = desrcription
       
    }


    

}
