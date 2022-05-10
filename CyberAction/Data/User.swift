//
//  User.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import Foundation
import UIKit

class User {
    static var currentUser: Person? = Person(avatar: UIImage(named: "raiden")!, nickname: "Raiden", balance: 50000)
    
    static func initFictiveUser() {
        currentUser = Person(avatar: UIImage(named: "raiden")!, nickname: "String", balance: 2222)
    }
}
