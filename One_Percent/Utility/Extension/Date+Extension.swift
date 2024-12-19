//
//  Date+Extension.swift
//  One_Percent
//
//  Created by 윤여진 on 12/19/24.
//

import Foundation

extension Date {
    
    var yyyyMMddHHmmss: String {
        get {
            let df = DateFormatter()
            df.dateFormat = DateFormat.yyyyMMddHHmmss.rawValue
            return df.string(from: self)
        }
    }

    var yyyyMMddHHmmssSSS: String {
        get {
            let df = DateFormatter()
            df.dateFormat = DateFormat.yyyyMMddHHmmssSSS.rawValue
            return df.string(from: self)
        }
    }

    var yyyyMMdd: String {
        get {
            let df = DateFormatter()
            df.dateFormat = DateFormat.yyyyMMdd.rawValue
            return df.string(from: self)
        }
    }
    
    var yyyyMMddHHmmssSSSSSS : String {
        get {
            let df = DateFormatter()
            df.dateFormat = DateFormat.yyyyMMddHHmmssSSSSSS.rawValue
            return df.string(from: self)
        }
    }
    
    var yyyy_MM_dd_HH_mm_ss : String {
        get {
            let df = DateFormatter()
            df.dateFormat = DateFormat.yyyy_MM_dd_HH_mm_ss.rawValue
            return df.string(from: self)
        }
    }
    
    var yyyy_MM_dd_HH_mm : String {
        get {
            let df = DateFormatter()
            df.dateFormat = DateFormat.yyyy_MM_dd_HH_mm.rawValue
            return df.string(from: self)
        }
    }

    func localizeDate(format: String?) -> String? {
        let df = DateFormatter()
        df.locale = Locale.current
        df.dateFormat = format ?? DateFormat.yyyy_MM_dd_HH_mm_ssZ.rawValue
        return df.string(from: self)
    }

    func addDateComponents(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date? {
        var dc = DateComponents()
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = hour
        dc.minute = minute
        dc.second = second

        let addDate = Calendar.current.date(byAdding: dc, to: self)

        return addDate
    }

    var year: Int {
        get {
            return Calendar.current.component(.year, from: self)
        }
    }

    var month: Int {
        get {
            return Calendar.current.component(.month, from: self)
        }
    }

    var day: Int {
        get {
            return Calendar.current.component(.day, from: self)
        }
    }

    var hour: Int {
        get {
            return Calendar.current.component(.hour, from: self)
        }
    }

    var minute: Int {
        get {
            return Calendar.current.component(.minute, from: self)
        }
    }

    var second: Int {
        get {
            return Calendar.current.component(.second, from: self)
        }
    }
}

