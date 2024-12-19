//
//  DateUtils.swift
//  One_Percent
//
//  Created by 윤여진 on 12/19/24.
//

import Foundation

enum DateFormat : String {
    case yyyy_MM_dd_HH_mm_ssZ = "yyyy-MM-dd HH:mm:ssZ"
    case yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    case yyyy_MM_dd_HH_mm = "yyyy-MM-dd HH:mm:00"
    case yyyyMMddHHmmssSSSSSS = "yyyyMMddHHmmssSSSSSS"
    case yyyyMMddHHmmssSSS = "yyyyMMddHHmmssSSS"
    case yyyyMMddHHmmss = "yyyyMMddHHmmss"
    case yyyyMMddHHmm   = "yyyyMMddHHmm"
    case yyyyMMdd       = "yyyyMMdd"
}

final class DateUtils {
    
    static let shared = DateUtils()
    
    private init() { }
    
    //String To String
    public func stringToString(date: String, from: String, to: String) -> String {
        if date.count == 0 { return "" }
        
        var newDate = Date()
        
        let dateFormatter1:DateFormatter! = DateFormatter()
        dateFormatter1.dateFormat = from
        newDate = dateFormatter1.date(from: date)!
        
        let dateFormatter2:DateFormatter! = DateFormatter()
        dateFormatter2.dateFormat = to
        return dateFormatter2.string(from: newDate)
    }
    
    
    //String To Date
    func stringToDate(_ str: String?, format: String) -> Date? {
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: str!)
    }
    
    func defaultDateFormatter( _ date: Date?, formatString: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        let gDate = dateFormatter.string(from: date!)
        return gDate
    }
    
    //년월일 포멧(19700101)
    func yyyymmdd(date: Date) -> String {
        let dateFormatter:DateFormatter! = DateFormatter()
        dateFormatter.dateFormat = DateFormat.yyyyMMdd.rawValue
        return dateFormatter.string(from: date)
    }

    //시간(00:00)
    public func hhmm(date: Date) -> String {
        let dateFormatter:DateFormatter! = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        return dateFormatter.string(from: date)
    }
    
    //초(00)
    public func ss(date: Date) -> String {
        
        let dateFormatter:DateFormatter! = DateFormatter()
        dateFormatter.dateFormat = "ss"
        return dateFormatter.string(from: date)
    }
    
    public func yyyyMMddHHmmToDate(date: String)-> Date {
        
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = DateFormat.yyyyMMddHHmm.rawValue
        let convertDate = formatter.date(from: date)
        let requestDate: () = formatter.timeZone = TimeZone(identifier: "UTC")
        
        return convertDate!
    }
    
    public func yyyyMMddHHmmssToDate(date: String)-> Date {
        
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = DateFormat.yyyyMMddHHmmss.rawValue
        let convertDate = formatter.date(from: date)
        let requestDate: () = formatter.timeZone = TimeZone(identifier: "UTC")
        
        return convertDate!
    }
    
    public func yyyyMMddToDate(date: String)-> Date {
        
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = DateFormat.yyyyMMdd.rawValue
        let convertDate = formatter.date(from: date)
        
        return convertDate!
    }
    
    public func dateToStringByTimeZone(date: Date, format: String, timezone: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        if timezone != "" {
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
        }
        let convertDate = dateFormatter.string(from: date)
        
        return convertDate
    }
    
    public func dateToString(date:Date, format:String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }

    // 시간(초) 구하기
    func timeIntervalSince(start: String, end: String) -> Int {

        let startTime = stringToDate(start, format: DateFormat.yyyyMMddHHmmss.rawValue)
        let endTime = stringToDate(end, format: DateFormat.yyyyMMddHHmmss.rawValue)

        return Int(endTime!.timeIntervalSince(startTime!))
    }

    public func timeIntervalSince(startTime : Date, endTime:Date) -> Int {
        return Int(endTime.timeIntervalSince(startTime))
    }
    
}

