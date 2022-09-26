//
//  StockRepository.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/22.
//

import Foundation

import RealmSwift

// 여러개의 테이블 => CRUD

protocol StockRepositoryType {
    func fetch() -> Results<Stock>
    func fetchSort(_ sort: String) -> Results<Stock>
    func fetchStock(_ item: Stock)
    func deleteItem(_ item: Stock)
    func addItem(_ item: Stock)
}
    

class StockRepository: StockRepositoryType {
    
    let config = Realm.Configuration(schemaVersion: 1)

    lazy var localRealm = try! Realm(configuration: config)
    
    func fetch() -> Results<Stock> {
        return localRealm.objects(Stock.self).sorted(byKeyPath: "stockName", ascending: false)
    }
    
    func fetchSort(_ sort: String) -> Results<Stock> {
        return localRealm.objects(Stock.self).sorted(byKeyPath: sort, ascending: true)
    }
    
    func fetchStock(_ item: Stock) {
        try! self.localRealm.write {
            self.localRealm.add(item)
        }
    }
    
    func filterStock(_ filter: NSPredicate) -> Results<Stock> {
        return localRealm.objects(Stock.self).filter(filter).sorted(byKeyPath: "stockName", ascending: false)
    }
    
    func deleteItem(_ item: Stock) {

        try! self.localRealm.write {
            self.localRealm.delete(item)
        }
    }
  
    func addItem(_ item: Stock) {
        
    }
}
