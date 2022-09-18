//
//  ChartModel.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/18.
//

import UIKit

struct ChartInfo {
    
    let chartPattern: [PatternsModel] = [
    
        PatternsModel(title: "박스권 패턴", description: "박스권 패턴에 대한 설명", imageName: "박스권 패턴"),
        PatternsModel(title: "삼각수렴_1", description: "삼각수렴의 대한 설명", imageName: "삼각수렴01"),
        PatternsModel(title: "삼각수렴_2", description: "삼각수렴의 대한 설명", imageName: "삼각수렴02"),
        PatternsModel(title: "3 Rising Valleys", description: "2", imageName: "3 rising valleys"),
        PatternsModel(title: "3 Descending Peaks", description: "2", imageName: "3 descending Peaks"),
        PatternsModel(title: "오름차순 삼각형 패턴", description: "2", imageName: "Ascending Triangle"),
        PatternsModel(title: "내림차순 삼각형 패턴", description: "2", imageName: "Descending Triangle"),
        PatternsModel(title: "컵 위드 핸들", description: "2", imageName: "Cup and Handle"),
        PatternsModel(title: "리버스 컵 위드 핸들", description: "2", imageName: "Inverted Cup and Handle"),
        PatternsModel(title: "플래그 패턴", description: "2", imageName: "Flag"),
        PatternsModel(title: "측정된 이동 패턴", description: "반전 패턴으로 시작하여 연속 패턴으로 다시 시작되는 세 부분으로 구성된 포메이션", imageName: "Measured move up"),
        PatternsModel(title: "페넌트 차트 패턴", description: "삼각형의 깃발 모양 패턴", imageName: "Pennant"),
        PatternsModel(title: "삼각수렴_3", description: "2", imageName: "Symmetrical Triangle"),
        PatternsModel(title: "이중 천정", description: "2", imageName: "이중 천정"),
        PatternsModel(title: "Descending scallop", description: "내림차순 가리비 패턴의 모양은 J 의 거울 이미지와 유사합니다. 패턴의 시작 부분에서 가격 수준의 급격한 하락이 있습니다. 최저점에 도달한 후 점차 회복되어 바닥에 둥근 계곡을 형성합니다. 왼쪽 봉우리가 오른쪽 봉우리보다 높아서 패턴의 모양을 정당화합니다", imageName: "Descending scallop")
        
        
        
    ]
}
