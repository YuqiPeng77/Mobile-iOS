//
//  Chat.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import Foundation

struct Chat: Codable{
    var name: String
    var message: String
    var time: String
    var email: String
    
    init(name: String, message: String, time: String, email: String) {
        self.name = name
        self.message = message
        self.time = time
        self.email = email
    }
}
