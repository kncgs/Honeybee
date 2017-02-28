//
//  DateExtension.swift
//  Honeybee
//
//  Created by Dongbing Hou on 27/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

extension Date {
    
    /// "2017-02-26 09:30:18 +0000" -> 2017-02-26 09:30:18 +0000
    static func date(str: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        return formatter.date(from: str)!
    }
    
    /// 2017-02-26 10:48:11 +0000 -> 2017-02-26 18:48:11 +0000
    static func currentTimeZoneDateFrom(aDate date: Date) -> Date {
        let sourceTZ = TimeZone(abbreviation: "GMT")!
        let destTZ = TimeZone.current
        let sourceOffset = sourceTZ.secondsFromGMT(for: date)
        let destOffset = destTZ.secondsFromGMT(for: date)
        let interval = TimeInterval(destOffset - sourceOffset)
        return Date(timeInterval: interval, since: date)
    }
    /// 2017-02-26 18:35:52 +0000 -> ("2017-02-26", "18:35")  //("2017", "02", "26")
    static func yearMonthDayHourMinute(date: Date) -> (String, String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd MM:ss"
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        let dateStr = formatter.string(from: date)
        let components = dateStr.components(separatedBy: " ")
        return (components[0], components[1])
    }
    
    
    
    /// 2017-02-26 18:35:52 +0000 -> ("2017", "02", "26")
    static func yearMonthDay(date: Date) -> (year: String, month: String, day: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        let dateStr = formatter.string(from: date)
        let components = dateStr.components(separatedBy: "-")
        return (components[0], components[1], components[2])
    }
    //    /// 2017-02-26 18:35:52 +0000 -> "02月26日")
    //    static func monthDay(date: Date) -> String {
    //        let formatter = DateFormatter()
    //        formatter.dateFormat = "MM月dd日"
    //        formatter.timeZone = TimeZone(abbreviation: "GMT")
    //        let dateStr = formatter.string(from: date)
    //        return dateStr
    //    }
    /// 2017-02-26 18:35:52 +0000 -> "2-26"
    static func monthDay(date: Date) -> String {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(identifier: "GMT")!
        let day = cal.component(.day, from: date)
        let month = cal.component(.month, from: date)
        //        let year = cal.component(.year, from: date)
        //        let ymd = cal.dateComponents([.year, .month, .day], from: date)
        return "\(month)月\(day)日"
    }
    
    static func weekday(date: Date) -> String {
        // "EEEE, MMMM, dd, yyyy"
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(identifier: "GMT")!
        let weekday = cal.component(.weekday, from: date)
        switch weekday {
        case 1:
            return "星期日"
        case 2:
            return "星期一"
        case 3:
            return "星期二"
        case 4:
            return "星期三"
        case 5:
            return "星期四"
        case 6:
            return "星期五"
        case 7:
            return "星期六"
        default:
            return ""
        }
    }
}