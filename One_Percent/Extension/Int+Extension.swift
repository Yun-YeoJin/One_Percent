//
//  Int+Extension.swift
//  One_Percent
//
//  Created by 윤여진 on 2022/09/16.
//

import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
