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
    let lastDayOfWeek: DayOfWeek
}

enum DayOfWeek: String, CaseIterable {
    //gregorian
    case Monday = "ПН"
    case Tuesday = "ВТ"
    case Wednesday = "СР"
    case Thursday = "ЧТ"
    case Friday = "ПТ"
    case Saturday = "СБ"
    case Sunday = "ВС"
    
}


extension CaseIterable where Self: Equatable {

    var index: Self.AllCases.Index? {
        return Self.allCases.index { self == $0 }
    }
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        //вернуть по нашему календарю (iso8601 возвращает тоже с воскресенья) 
        let day = (Calendar.current.dateComponents([.weekday], from: self).weekday ?? 0) - 1
        return day < 1 ? 7 : day
    }
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
