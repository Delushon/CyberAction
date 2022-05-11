//
//  TimePackage.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import Foundation

struct TimePackage: CustomStringConvertible {
    var description: String {
        let timeString = "\(hour):\(minute)"
        if timeString.count < 5 { return timeString + "0" } else { return timeString }
    }
    
    let hour: Int
    let minute: Int
}


