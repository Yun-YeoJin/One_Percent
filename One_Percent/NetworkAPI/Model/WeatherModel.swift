//
//  WeatherModel.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/13.
//

import Foundation

struct WeatherModel {
    
    let name: String
    let temp: Double
    let humidity: Double
    let windspeed: Double
    let iconNumber: String
    
    var nameText: String {
        get {
            return " \(name)의 날씨"
        }
    }
    
    var tempText: String {
        get {
            return "\(round(temp - 273.15))℃"
        }
    }
    
    var humidityText: String {
        get {
            return "  습도: \(round(humidity))"
        }
    }
    
    var windSpeedText: String {
        get {
            " 풍속: \(round(windspeed)) "
        }
    }
}
