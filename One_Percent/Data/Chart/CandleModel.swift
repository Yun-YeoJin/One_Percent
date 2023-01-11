//
//  CandleModel.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/19.
//

import UIKit

struct CandleInfo {
    
    static let candlePattern: [PatternsModel] = [
    
        PatternsModel(title: "하이웨이브 캔들", description: "추세전환 확률 : 51%", imageName: "Candle01"),
        PatternsModel(title: "숏바디 캔들", description: "계속 진행될 확률 : 추세전환 확률 = 50% : 50%", imageName: "Candle02"),
        PatternsModel(title: "긴꼬리 도지형 캔들", description: "계속진행될 확률 : 51%", imageName: "Candle03"),
        PatternsModel(title: "드래곤플라이 도지", description: "드래곤플라이 도지 캔들은 발생후 지속적 하락을 보인다면, 주가는 상승전환하는 모습을 보입니다. 추세전환 신호이기도 하며, 매수관점으로 접근하시면 좋습니다.", imageName: "Candle04"),
        PatternsModel(title: "그레이브스톤 도지", description: "그레이브스톤 도지 캔들은 발생한 후 상승추세에서 하락추세로 전환하는 모습이라면, 추세전환 신호이기도 하며, 매도관점으로 접근하시면 좋습니다.", imageName: "Candle05"),
        PatternsModel(title: "하락형 기본 도지", description: "상승으로 추세전환될 확률 : 52%", imageName: "Candle06"),
        PatternsModel(title: "상승형 기본 도지", description: "상승이 계속 진행될 확률 : 51%", imageName: "Candle07"),
        PatternsModel(title: "망치형 캔들", description: "상승으로 추세전환될 확률 : 60%", imageName: "Candle08"),
        PatternsModel(title: "교수형 캔들", description: "상승이 계속 진행될 확률 : 59%", imageName: "Candle09"),
        PatternsModel(title: "역망치형 캔들", description: "하락이 계속 진행될 확률 : 59%", imageName: "Candle10"),
        PatternsModel(title: "유성형 캔들", description: "하락으로 추세전환될 확률 : 59%", imageName: "Candle11"),
        PatternsModel(title: "음봉후 역망치형 캔들", description: "하락으로 계속 진행될 확률 : 65%", imageName: "Candle12"),
        PatternsModel(title: "양봉후 유성형 캔들", description: "상승으로 계속 진행될 확률 : 61%", imageName: "Candle13"),
        PatternsModel(title: "상승 샅바형 캔들", description: "상승으로 추세전환될 확률 : 71%", imageName: "Candle14"),
        PatternsModel(title: "하락 샅바형 캔들", description: "하락으로 추세전환될 확률 : 68%", imageName: "Candle15"),
        PatternsModel(title: "하락 장악형 캔들 ", description: "하락으로 계속 진행될 확률 : 65%", imageName: "Candle16"),
        PatternsModel(title: "상승 장악형 캔들", description: "상승으로 계속 진행될 확률 : 68%", imageName: "Candle17"),
        PatternsModel(title: "강한 음봉후 도지 캔들", description: "하락으로 계속 진행될 확률 : 64%", imageName: "Candle18"),
        PatternsModel(title: "강한 양봉후 도지 캔들", description: "상승으로 계속 진행될 확률 : 71%", imageName: "Candle19"),
        PatternsModel(title: "상승 잉태형 캔들", description: "상승으로 추세전환될 확률 : 53%", imageName: "Candle20"),
        PatternsModel(title: "하락 잉태형 캔들", description: "하락으로 추세전환될 확률 : 53%", imageName: "Candle21"),
        PatternsModel(title: "상승 장악형 캔들", description: "상승으로 추세전환될 확률 : 63%", imageName: "Candle22"),
        PatternsModel(title: "하락 장악형 캔들", description: "하락으로 추세전환될 확률 : 79%", imageName: "Candle23"),
        PatternsModel(title: "상승 십자 잉태형 캔들", description: "하락으로 계속 진행될 확률 : 55%", imageName: "Candle24"),
        PatternsModel(title: "하락 십자 잉태형 캔들", description: "상승으로 계속 진행될 확률 : 57%", imageName: "Candle25"),
        PatternsModel(title: "관통형 캔들", description: "상승으로 추세전환될 확률 : 64%", imageName: "Candle26"),
        PatternsModel(title: "흑운형 캔들", description: "하락으로 추세전환될 확률 : 60%", imageName: "Candle27"),
        PatternsModel(title: "샛별형 캔들", description: "상승으로 추세전환될 확률 : 78%", imageName: "Candle28"),
        PatternsModel(title: "석별형 캔들", description: "하락으로 추세전환될 확률 : 72%", imageName: "Candle29"),
        PatternsModel(title: "상승 잉태 확인형 캔들", description: "상승으로 추세전환될 확률 : 65%", imageName: "Candle30"),
        PatternsModel(title: "하락 잉태 확인형 캔들", description: "하락으로 추세전환될 확률 : 60%", imageName: "Candle31"),
        PatternsModel(title: "상승 장악 확인형 캔들", description: "상승으로 추세전환될 확률 : 75%", imageName: "Candle32"),
        PatternsModel(title: "하락 장악 확인형 캔들", description: "하락으로 추세전환될 확률 : 69%", imageName: "Candle33"),


    ]
}
