//
//  FictiveData.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import Foundation

class FictiveData {
    
    static let instance = FictiveData()
    
    var histories: [History] = []
    
    init() {
        initHistories()
    }
    
    func initHistories() {
        for _ in 0...30 {
            histories.append(History(date: Date.random(), amount: Int.random(in: 100...1000), type: HistoryType.random()))
            print(Int.random(in: 0...1) == 0 ? HistoryType.receive : HistoryType.spend)
        }
    }
}

extension HistoryType {
    static func random() -> HistoryType {
        Int.random(in: 0...1) == 0 ? HistoryType.receive : HistoryType.spend
    }
}

extension Date {
    

    static func random() -> Date {
        let date1 = Date.parse("2018-01-01")
        let date2 = Date()
        
        let span = TimeInterval.random(in: date1.timeIntervalSinceNow...date2.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: span)
    }

    func dateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }

    static func parse(_ string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: string)!
        return date
    }
}
