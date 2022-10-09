//
//  APIManager.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/10.
//

import UIKit

import Alamofire
import SwiftyJSON

//MARK: 네이버 뉴스 검색 API
class NewsAPIManager {
    
    static let shared = NewsAPIManager()
    
    private init() { }
    
    func requestNewsData(query: String, startPage: Int, completionHandler: @escaping ([NewsModel]) -> () ) {
    
    let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = EndPoint.newsURL + "query=\(text)&display=50&start=\(startPage)"
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.NAVER_ID,
            "X-Naver-Client-Secret": APIKey.NAVER_SECRET
        ]
        
        AF.request(url, method: .get, headers: header).validate().responseData(queue: .global()) {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                let list = json["items"].arrayValue.map { NewsModel(title: $0["title"].stringValue, description: $0["description"].stringValue, pubDate: $0["pubDate"].stringValue, link: $0["link"].stringValue)
                }
                
                completionHandler(list)
                
                
            case .failure(let error):
                print(error)
            }
        }
    
    }
}

//MARK: 카카오 주소찾기 API
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

//MARK: OpenWeather 날씨 API
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

//MARK: 공공데이터 상장종목정보 API
class StockNameAPIManager {

    private init() {}

    static let shared = StockNameAPIManager()

    func getStockName(query: String, completionHandler: @escaping ([StockNameModel]) -> ()) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let url = "\(EndPoint.stockNameURL)serviceKey=\(APIKey.stock)&resultType=json&numOfRows=50&basDt=20220923&likeItmsNm=\(query)"
       
        AF.request(url, method: .get).validate().responseData(queue: .global()) { response in
            switch response.result {

            case .success(let value):
                let json = JSON(value)

                let stockName = json["response"]["body"]["items"]["item"].arrayValue.map {
                    StockNameModel(stockName: $0["itmsNm"].stringValue, stockMarket: $0["mrktCtg"].stringValue, stockNumber: $0["srtnCd"].stringValue)
                }

                completionHandler(stockName)

            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: 공공데이터 주식 가격정보 API
class StockPriceAPIManager {

    private init() {}

    static let shared = StockPriceAPIManager()

    func getStockPrice(query: String, baseDate: String, completionHandler: @escaping (String) -> () ) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let url = "\(EndPoint.stockPriceURL)serviceKey=\(APIKey.stock)&numOfRows=1&resultType=json&endBasDt=\(baseDate)&itmsNm=\(query)"
       
        AF.request(url, method: .get).validate().responseData(queue: .global()) { response in
            switch response.result {

            case .success(let value):
                let json = JSON(value)
    
                completionHandler(json["response"]["body"]["items"]["item"][0]["clpr"].stringValue)

            case .failure(let error):
                print(error)
            }
        }
    }
}


