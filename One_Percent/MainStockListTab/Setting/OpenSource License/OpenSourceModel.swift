//
//  OpenSourceModel.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/28.
//

import Foundation

struct OpenSourceModel {
    
    var name: String
    var url: String
    var copyright: String
    var license: String
    
}

struct OpenSourceInfo {
    
    static let OpenSource: [OpenSourceModel] = [
    
        OpenSourceModel(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire.git", copyright: "Copyright (c) 2014-2022 Alamofire Software Foundation (http://alamofire.org/)", license: "The MIT License(MIT)"),
        
        OpenSourceModel(name: "JGProgressHUD", url: "https://github.com/JonasGessner/JGProgressHUD.git", copyright: "Copyright (c) 2014-2018 Jonas Gessner", license: "The MIT License(MIT)"),
        
        OpenSourceModel(name: "Kingfisher", url: "https://github.com/onevcat/Kingfisher.git", copyright: "Copyright (c) 2019 Wei Wang", license: "The MIT License(MIT)"),
        
        OpenSourceModel(name: "Tabman", url: "https://github.com/uias/Tabman.git", copyright: "Copyright (c) 2022 UI At Six", license: "The MIT License(MIT)"),
        
        OpenSourceModel(name: "Snapkit", url: "https://github.com/SnapKit/SnapKit.git", copyright: "Copyright (c) 2011-Present SnapKit Team - https://github.com/SnapKit", license: "The MIT License(MIT)"),
        
        OpenSourceModel(name: "Then", url: "https://github.com/devxoul/Then.git", copyright: "Copyright (c) 2015 Suyeol Jeon (xoul.kr)", license: "The MIT License(MIT)"),
        
        OpenSourceModel(name: "Realm", url: "https://github.com/realm/realm-swift.git", copyright: "Copyright (c) 2011-2017 Realm Inc All rights reserved", license: "The MIT License(MIT)"),
        
        OpenSourceModel(name: "SwiftyJSON", url: "https://github.com/SwiftyJSON/SwiftyJSON.git", copyright: "Copyright (c) 2017 Ruoyu Fu", license: "The MIT License(MIT)")
    
    ]
}
