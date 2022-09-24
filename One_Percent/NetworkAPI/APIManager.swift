//
//  APIManager.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/10.
//

import UIKit

import Alamofire
import SwiftyJSON

class NewsAPIManager {
    
    static let shared = NewsAPIManager()
    
    private init() { }
    
    func requestNewsData(query: String, startPage: Int, completionHandler: @escaping ([NewsModel]) -> () ) {
    
    let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = EndPoint.newsURL + "query=\(text)&display=10&start=\(startPage)"
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.NAVER_ID,
            "X-Naver-Client-Secret": APIKey.NAVER_SECRET
        ]
        
        AF.request(url, method: .get, headers: header).validate().responseData(queue: .global()) {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
   
                let list = json["items"].arrayValue.map { NewsModel(title: $0["title"].stringValue, description: $0["description"].stringValue, pubDate: $0["pubDate"].stringValue, link: $0["link"].stringValue)
                }
                
                completionHandler(list)
                
                
            case .failure(let error):
                print(error)
            }
        }
    
    }
}

class AddressAPIManager {

    private init() {}

    static let shared = AddressAPIManager()

    func getLocationData(lat: Double, lon: Double, completionHandler: @escaping (AddressModel) -> ()) {

        let url = EndPoint.kakaoAddress + "x=\(lon)&y=\(lat)&input_coord=WGS84"

        let header: HTTPHeaders = [
            "Authorization": "KakaoAK \(APIKey.kakao)"
        ]

        AF.request(url, method: .get, headers: header).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)

                let address = json["documents"].arrayValue[0]["address"]

                let first = address["region_1depth_name"].stringValue
                let second = address["region_2depth_name"].stringValue

                completionHandler(AddressModel(regionFirst: first, regionSecond: second))

            case .failure(let error):
                print(error)
            }
        }

    }
}

class WeatherAPIManager {
    
    private init() {}
    
    static let shared = WeatherAPIManager()
    
    func getWeatherData(lat: Double, lon: Double, completionHandler: @escaping (WeatherModel) -> ()) {
        
        let url = "\(EndPoint.weatherURL)lat=\(lat)&lon=\(lon)&appid=\(APIKey.openWeather)"
        
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let main = json["main"]
                
                let temp = Int(round(main["temp"].doubleValue - 273.15))
                let tempMin = Int(round(main["temp_min"].doubleValue - 273.15))
                let tempMax = Int(round(main["temp_max"].doubleValue - 273.15))
                let pressure = main["pressure"].intValue
                let humidity = main["humidity"].intValue
                let wind = round(json["wind"]["speed"].doubleValue * 10) / 10
                let iconId = json["weather"][0]["icon"].stringValue
                let weatherName = json["weather"][0]["main"].stringValue
                
                let weather = WeatherModel(temp: temp, temp_min: tempMin, temp_max: tempMax, pressure: pressure, humidity: humidity, wind: wind, iconId: iconId, weather: weatherName)
                
                completionHandler(weather)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}


