//
//  ChartPatternViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit


class ChartPatternViewController: BaseViewController {
    
    let mainView = ChartPatternView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.searchBar.delegate = self
        mainView.collectionView.register(ChartPatternCollectionViewCell.self, forCellWithReuseIdentifier: ChartPatternCollectionViewCell.reusableIdentifier)
        mainView.collectionView.collectionViewLayout = collectionViewLayout()
    }
    
    override func configureUI() {
        
        navigationItem.title = "차트 패턴"
        navigationController?.navigationBar.tintColor = .systemMint
        
    }
    
    
}

extension ChartPatternViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartPatternCollectionViewCell.reusableIdentifier, for: indexPath) as? ChartPatternCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = (UIScreen.main.bounds.width / 3) - ((layout.minimumInteritemSpacing * 3) - (spacing * 2))
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        return layout
    }
    
    
}

extension ChartPatternViewController: UISearchBarDelegate {
    
}
