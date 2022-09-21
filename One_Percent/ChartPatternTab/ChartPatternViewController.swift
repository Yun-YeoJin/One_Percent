//
//  ChartPatternViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit


class ChartPatternViewController: BaseViewController {
    
    let mainView = ChartPatternView()
    
    var chartDetail = ChartInfo()
    var candleDetail = CandleInfo()
   
    enum Section: CaseIterable {
        case chartPattern
        case candlePattern
        
        var title: String {
            switch self {
            case .chartPattern: return "About Chart Patterns"
            case .candlePattern: return "About Candle Patterns"
            }
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.searchBar.delegate = self
        mainView.collectionView.register(ChartPatternCollectionViewCell.self, forCellWithReuseIdentifier: ChartPatternCollectionViewCell.reusableIdentifier)
        mainView.collectionView.register(ChartPatternHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ChartPatternHeaderView")
        
        mainView.collectionView.collectionViewLayout = layout()
        
    }
    
    override func configureUI() {
        
        navigationItem.title = "차트 패턴"
        navigationController?.navigationBar.backgroundColor = Constants.BaseColor.background
        navigationController?.navigationBar.tintColor = .systemMint
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "VITRO CORE TTF", size: 20)!]
        
    }
    
}

extension ChartPatternViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return chartDetail.chartPattern.count
        } else {
            return candleDetail.candlePattern.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartPatternCollectionViewCell.reusableIdentifier, for: indexPath) as? ChartPatternCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.section == 0 {
            let data = chartDetail.chartPattern[indexPath.item]
            cell.titleLabel.text = data.title
            cell.chartImageView.image = UIImage(named: data.imageName)
        } else {
            let data = candleDetail.candlePattern[indexPath.item]
            cell.titleLabel.text = data.title
            cell.chartImageView.image = UIImage(named: data.imageName)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = ChartDetailViewController()
        if indexPath.section == 0 {
            vc.patternData = chartDetail.chartPattern[indexPath.item]
        } else {
            vc.patternData = candleDetail.candlePattern[indexPath.item]
        }
        transition(vc, transitionStyle: .presentNavigation)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
                    if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ChartPatternHeaderView.identifier, for: indexPath) as? ChartPatternHeaderView {
                        if indexPath.section == 0 {
                            header.titleLabel.text = Section.chartPattern.title
                        } else {
                            header.titleLabel.text = Section.candlePattern.title
                        }
                        return header
                    }
                }
                return UICollectionReusableView()
            }
    
        
    }

extension ChartPatternViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = mainView.collectionView.frame.width
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
}
    

extension ChartPatternViewController: UISearchBarDelegate {
    
}

private func layout() -> UICollectionViewCompositionalLayout {
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))//Label 크기에 따른 사이즈 자동 조절
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2) //2줄로 표현하겠다.
    group.interItemSpacing = .fixed(20)
    
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20)
    section.interGroupSpacing = 20
    
    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
    
    let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    section.boundarySupplementaryItems = [header]
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}
