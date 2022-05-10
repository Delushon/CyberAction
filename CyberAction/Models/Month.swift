//
//  Month.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import Foundation

struct Month {
    let numberOfYear: Int
    let numberOfMonth: Int
    let name: String
    let daysCount: Int
    let firstDayOfWeek: DayOfWeek
}

enum DayOfWeek: String {
    //gregorian
    case Sunday = "ВС"
    case Monday = "ПН"
    case Tuesday = "ВТ"
    case Wednesday = "СР"
    case Thursday = "ЧТ"
    case Friday = "ПТ"
    case Saturday = "СБ"
    
}

extension DayOfWeek: CaseIterable {
    
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
