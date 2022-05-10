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
    var cities: [City] = []
    var months: [Month] = []
    
    init() {
        initHistories()
        initCities()
        initMonths()
    }
    
    func initMonths() {
        for i in 0...11 {
            let nextMonth = Calendar.current.date(byAdding: .month, value: i, to: Date())
            let monthInt = Calendar.current.component(.month, from: nextMonth ?? Date())
            let yearInt = Calendar.current.component(.year, from: nextMonth ?? Date())
            let firstDayOfWeekForMonth = DayOfWeek.allCases[(nextMonth?.startOfMonth().dayNumberOfWeek() ?? 1) - 1]
            
            let range = Calendar.current.range(of: .day, in: .month, for: nextMonth ?? Date())!
            let numDays = range.count
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "LLLL"
            let stringDate = dateFormatter.string(from: nextMonth ?? Date())
            months.append(Month(numberOfYear: yearInt, numberOfMonth: monthInt, name: stringDate, daysCount: numDays, firstDayOfWeek: firstDayOfWeekForMonth))
        }
    }
    
    func initHistories() {
        for _ in 0...30 {
            histories.append(History(date: Date.random(), amount: Int.random(in: 100...1000), type: HistoryType.random()))
            print(Int.random(in: 0...1) == 0 ? HistoryType.receive : HistoryType.spend)
        }
    }
    
    func initCities() {
        let cityA = City(name: "Нур-Султан", places: returnThreeAdresses(cityName: "Нур-Султан"))
        let cityB = City(name: "Актобе", places: returnThreeAdresses(cityName: "Актобе"))
        let cityC = City(name: "Алматы", places: returnThreeAdresses(cityName: "Алматы"))
        let cityD = City(name: "Шымкент", places: returnThreeAdresses(cityName: "Шымкент"))
        
        cities = [cityA, cityB, cityC, cityD]
    }
    
    func returnThreeAdresses(cityName: String) -> [Place] {
        var places: [Place] = []
        places.append(Place(address: "\(cityName) адрес 1"))
        places.append(Place(address: "\(cityName) адрес 2"))
        places.append(Place(address: "\(cityName) адрес 3"))
        
        return places
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
