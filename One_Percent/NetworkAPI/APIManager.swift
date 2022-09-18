//
//  APIManager.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/10.
//

import UIKit

import Alamofire
import SwiftyJSON

class OpenWeatherAPIManager {

    static let shared = OpenWeatherAPIManager()

    private init() { }

    var list: [WeatherModel] = []

    func requestAPI(_ lat: Double, _ lon: Double, completionHandler: @escaping (WeatherModel) -> ()) {

        // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
        let url = "\(EndPoint.weatherURL)lat=\(lat)&lon=\(lon)&appid=\(APIKey.openWeather)"

        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
            
                
                let name = json["name"].stringValue
                let temp = json["main"]["temp"].doubleValue
                let humidity = json["main"]["humidity"].doubleValue
                let windspeed = json["wind"]["speed"].doubleValue
                let iconNumber = json["weather"][0]["icon"].stringValue
              

                let data = WeatherModel(name: name, temp: temp, humidity: humidity, windspeed: windspeed, iconNumber: iconNumber)

                completionHandler(data)

            case .failure(let error):
                print(error)
            }
        }
        print(list)
    }

}

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



