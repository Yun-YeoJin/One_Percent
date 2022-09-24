//
//  ChartPatternViewController.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/15.
//

import UIKit


class ChartPatternViewController: BaseViewController {
    
    let mainView = ChartPatternView()
   
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
    
    var chartData: [PatternsModel] = []
    var candleData: [PatternsModel] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(ChartPatternCollectionViewCell.self, forCellWithReuseIdentifier: ChartPatternCollectionViewCell.reusableIdentifier)
        mainView.collectionView.register(ChartPatternHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ChartPatternHeaderView")
        
        mainView.collectionView.collectionViewLayout = layout()
        
        mainView.searchBar.delegate = self
        mainView.searchBar.showsCancelButton = false
        
        chartData = ChartInfo.chartPattern
        candleData = CandleInfo.candlePattern
        

        self.navigationItem.hidesSearchBarWhenScrolling = false // Scroll시 Search부분 남겨두기
        
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
            return chartData.count
        } else {
            return candleData.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartPatternCollectionViewCell.reusableIdentifier, for: indexPath) as? ChartPatternCollectionViewCell else { return UICollectionViewCell() }
            
            if indexPath.section == 0 {
//                let data = ChartInfo.chartPattern[indexPath.item]
                let data = chartData[indexPath.item]
                cell.titleLabel.text = data.title
                cell.chartImageView.image = UIImage(named: data.imageName)
            } else {
//                let data = CandleInfo.candlePattern[indexPath.item]
                let data = candleData[indexPath.item]
                cell.titleLabel.text = data.title
                cell.chartImageView.image = UIImage(named: data.imageName)
            }
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = ChartDetailViewController()
        if indexPath.section == 0 {
            vc.patternData = chartData[indexPath.item]
        } else {
            vc.patternData = candleData[indexPath.item]
        }
        transition(vc, transitionStyle: .presentNavigation)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
                    if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ChartPatternHeaderView.identifier, for: indexPath) as? ChartPatternHeaderView {
                        
                        if indexPath.section == 0 {
                            
                            if chartData.isEmpty {
                                header.isHidden = true
                                header.titleLabel.snp.updateConstraints { make in
                                    make.edges.equalToSuperview()
                                    make.height.equalTo(0)
                                }
                            } else {
                                header.isHidden = false
                                header.titleLabel.text = Section.chartPattern.title
                                header.titleLabel.snp.updateConstraints { make in
                                    make.edges.equalToSuperview()
                                    make.height.equalTo(44)
                                }
                            }
                        } else {
                            if candleData.isEmpty {
                                header.isHidden = true
                                header.titleLabel.snp.updateConstraints { make in
                                    make.edges.equalToSuperview()
                                    make.height.equalTo(0)
                                }
                            } else {
                                header.isHidden = false
                                header.titleLabel.text = Section.candlePattern.title
                                header.titleLabel.snp.updateConstraints { make in
                                    make.edges.equalToSuperview()
                                    make.height.equalTo(44)
                                }
                            }
                            
                        }
                        
                        return header
                    }
                }
                return UICollectionReusableView()
            }

    }

private func layout() -> UICollectionViewCompositionalLayout {
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))//Label 크기에 따른 사이즈 자동 조절
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2) //2줄로 표현하겠다.
    group.interItemSpacing = .fixed(20)
    
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
    section.interGroupSpacing = 10
    
    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
    
    let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    section.boundarySupplementaryItems = [header]
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}

//MARK: UISearchBarController 설정
extension ChartPatternViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if searchText != "" {
            
            var filteredChartPatterns: [PatternsModel] = []
            for item in ChartInfo.chartPattern {
                if (item.title.lowercased().contains(searchBar.text!.lowercased())) {
                    filteredChartPatterns.append(item)
                }
            }
            chartData = filteredChartPatterns
            
            var filteredCandlePatterns: [PatternsModel] = []
            for item in CandleInfo.candlePattern {
                if (item.title.lowercased().contains(searchBar.text!.lowercased())) {
                    filteredCandlePatterns.append(item)
                }
            }
            candleData = filteredCandlePatterns


        } else {
            chartData = ChartInfo.chartPattern
            candleData = CandleInfo.candlePattern
        }
        
        mainView.collectionView.reloadData()
        

        
    }
    
}


