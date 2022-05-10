//
//  Month.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import Foundation

struct Month {
    let name: String
    let daysCount: Int
    let firstDayOfWeek: DayOfWeek
}

enum DayOfWeek: String {
    case Monday = "ПН"
    case Tuesday = "ВТ"
    case Wednesday = "СР"
    case Thursday = "ЧТ"
    case Friday = "ПТ"
    case Saturday = "СБ"
    case Sunday = "ВС"
}
