//
//  StockModel.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/22.
//

import Foundation
import RealmSwift

class Stock: Object {
    @Persisted var stockName: String //제목(필수)
    @Persisted var isBuy: Bool //매수 or 매도(필수)
    @Persisted var stockPrice: Int //주식가격(필수)
    @Persisted var stockQuantity: Int //주식수량(필수)
    @Persisted var stockDate: Date //제목(필수)
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    convenience init(stockName: String, isBuy: Bool ,stockPrice: Int, stockQuantity: Int, stockDate: Date) {
      self.init()
        
      self.stockName = stockName
      self.isBuy = isBuy
      self.stockPrice = stockPrice
      self.stockQuantity = stockQuantity
      self.stockDate = stockDate
      
        
    }
}
