//
//  WeatherModel.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/13.
//

import Foundation

struct WeatherModel {
    
    let temp: Int
    let temp_min: Int
    let temp_max: Int
    let pressure: Int
    let humidity: Int
    let wind: Double
    let iconId: String
    let weather: String
    
    var temperatureText: String {
        get {
            return "\(WeatherModel.getWeather(weather: weather)) \(temp)°"
        }
    }
    
    var maxMinText: String {
        get {
            return "최고 \(temp_max)° · 최저 \(temp_min)°"
        }
    }
    
    var windText: String {
        get {
            return "풍속    \(wind)m/s"
        }
    }
    
    var humidityText: String {
        get {
            return "습도    \(humidity)%"
        }
    }
    
    var pressureText: String {
        get {
            return "기압    \(pressure)hPa"
        }
    }
    
    static func getWeather(weather: String) -> String {
        
        switch weather {
        case Weather.thunderStorm:
            return "뇌우"
        case Weather.drizzle:
            return "이슬비"
        case Weather.rain:
            return "비"
        case Weather.snow:
            return "눈"
        case Weather.clear:
            return "맑음"
        case Weather.clouds:
            return "흐림"
        default :
            return "안개"
        }
    }
    
    static func getMessage(weather: String) -> String {
        switch weather {
        case Weather.thunderStorm:
            return "나무 아래에 있지 마세요."
        case Weather.drizzle:
            return "비가 조금씩 내리고 있어요!"
        case Weather.rain:
            return "밖에 비가 많이오니 우산 꼭 챙기세요!"
        case Weather.snow:
            return "눈이 많이 와서 미끄러워요."
        case Weather.clear:
            return "오늘 하루는 뭘해도 잘 될 하루네요!"
        case Weather.clouds:
            return "날씨가 많이 흐려요."
        default :
            return "안개가 많으니 운전 조심하세요!"
        }
    }
}

enum Weather {
        
    static let thunderStorm = "Thunderstorm"
    static let drizzle = "Drizzle"
    static let rain = "Rain"
    static let snow = "Snow"
    static let clear = "Clear"
    static let clouds = "Clouds"
    
}
