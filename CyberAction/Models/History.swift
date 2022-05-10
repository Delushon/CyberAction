//
//  History.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import Foundation

struct History {
    let date: Date
    let amount: Int
    let type: HistoryType
    
}

enum HistoryType: String {
    case spend = "Потрачено"
    case receive = "Получено"
}
