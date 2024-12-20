//
//  ChartModel.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/18.
//

import UIKit

struct ChartInfo {
    
    static let chartPattern: [PatternsModel] = [
    
        PatternsModel(title: "박스권 패턴", description: "상승 후 고점에서 저항을 맞고, 하락 시 저점에서 지지가 되는 형태, 만약 박스권 매매를 한다면 '저점매수''고점매도'의 방식을 이용합니다.", imageName: "박스권 패턴"),
        PatternsModel(title: "삼각수렴(1)", description: "고점은 낮아지고, 저점은 높아지면서 점점 삼각형 모양을 만들어갑니다. 힘싸움을 하면서 점점 가운데로 모이는 추세를 보고 상승할 지, 하락할 지는 모르지만 끝에서 방향성에 맞게 진입이 가능합니다.", imageName: "삼각수렴01"),
        PatternsModel(title: "삼각수렴(2)", description: "고점은 낮아지고, 저점은 높아지면서 점점 삼각형 모양을 만들어갑니다. 힘싸움을 하면서 점점 가운데로 모이는 추세를 보고 상승할 지, 하락할 지는 모르지만 끝에서 방향성에 맞게 진입이 가능합니다.", imageName: "삼각수렴02"),
        PatternsModel(title: "3개의 상승 골짜기 패턴", description: "상승형 패턴이며, 저점이 점점 높아지는 형태입니다.", imageName: "3 rising valleys"),
        PatternsModel(title: "3개의 하락 꼭대기 패턴", description: "하락형 패턴이며, 고점이 점점 낮아지는 형태입니다.", imageName: "3 descending Peaks"),
        PatternsModel(title: "상승형 삼각형 패턴", description: "상승형 삼각형 패턴이 나타나고 나서는 계속 상승할 가능성이 높습니다.", imageName: "Ascending Triangle"),
        PatternsModel(title: "하락형 삼각형 패턴", description: "하락형 삼각형 패턴이 나타나고 나서는 계속 하락할 가능성이 높습니다.", imageName: "Descending Triangle"),
        PatternsModel(title: "컵 위드 핸들", description: "상승형 패턴이기도 하며, 손잡이가 달린 컵의 모양과 비슷하다고 해서 컵 위드 핸들 패턴이라고 불립니다. 컵 부분은 U자형의 원만한 하락-상승 곡선을 그리며, 핸들 부분에서 V자 모양의 급격한 하락-상승 곡선을 보여주는 경우가 많습니다.", imageName: "Cup and Handle"),
        PatternsModel(title: "리버스 컵 위드 핸들", description: "하락형 패턴이기도 하며, 손잡이가 달린 컵의 모양과 비슷하다고 해서 컵 위드 핸들 패턴이라고 불립니다. 컵 부분은 U자형의 원만한 상승-하락 곡선을 그리며, 핸들 부분에서 V자 모양의 급격한 상승-하락 곡선을 보여주는 경우가 많습니다.", imageName: "Inverted Cup and Handle"),
        PatternsModel(title: "플래그 패턴", description: "채널 안에서 W자 혹은 M자를 그리며 움직이다가 상승으로 이어지는 패턴, 일반적으로 하방 채널을 그리다가 상승으로 이어지는 경우가 많습니다.", imageName: "Flag"),
        PatternsModel(title: "측정된 이동 패턴", description: "반전 패턴으로 시작하여 연속 패턴으로 다시 시작되는 세 부분으로 구성된 포메이션입니다.", imageName: "Measured move up"),
        PatternsModel(title: "페넌트 차트 패턴", description: "삼각형의 깃발 모양 패턴입니다.", imageName: "Pennant"),
        PatternsModel(title: "삼각수렴(3)", description: "고점은 낮아지고, 저점은 높아지면서 점점 삼각형 모양을 만들어갑니다. 힘싸움을 하면서 점점 가운데로 모이는 추세를 보고 상승할 지, 하락할 지는 모르지만 끝에서 방향성에 맞게 진입이 가능합니다.", imageName: "Symmetrical Triangle"),
        PatternsModel(title: "이중 천정", description: "쌍 고점이라고도 하며, 전고점 부근에서 강한 저항선이 생기며, 하락으로의 추세를 이어갈 수 있음, 단! 반대로 강한 저항을 뚫는다면 추세반전이 가능합니다. 뒤집어진 모양인 쌍바닥 패턴도 있습니다.", imageName: "이중 천정"),
        PatternsModel(title: "하락형 가리비 패턴", description: "내림차순 가리비 패턴의 모양은 J 의 거울 이미지와 유사합니다. 패턴의 시작 부분에서 가격 수준의 급격한 하락이 있습니다. 최저점에 도달한 후 점차 회복되어 바닥에 둥근 계곡을 형성합니다.", imageName: "Descending scallop"),
        PatternsModel(title: "더블 탑 이브 앤 이브", description: "패턴으로 이루어지는 상향 추세이며, 두 상단의 고점은 같은 가격 근처에서 정점에 도달해야 합니다. 이브 앤 이브 패턴으로 이어지는 빠른 이동은 돌파 후 빠른 하락으로 이어질 수 있습니다.", imageName: "더블 탑 이브 앤 이브"),
        PatternsModel(title: "아담 앤 이브 더블 탑 패턴", description: "아담 앤 이브 더블 탑 패턴은 두 개의 탑이 다르게 보이는 더블 탑압니다. 아담의 상단이 먼저 나타나며 좁고, V자의 거꾸로 된 모양을 띕니다. 이브는 아담을 따르고 아담보다 더 둥글고 넓어 보입니다. 가격이 아담과 이브 사이 낮은 골의 가격에서 마감되는지 확인해야 합니다. 확인하지 않고 계속 상승할 확률이 더 큽니다. ", imageName: "아담 앤 이브 더블 탑 패턴"),
        PatternsModel(title: "둥근 바닥형 패턴", description: "둥근 바닥형 패턴은 일반적으로 일봉이나 주봉에서 확인할 수 있습니다. 패턴은 하락세일 때보다 상승세일 때 형성되는 경우가 많습니다. 패턴 생성중 갑자기 급등하여 다시 하락 할 수 있으므로 주의가 필요합니다. ", imageName: "둥근 바닥형")

        
        
    ]
}
