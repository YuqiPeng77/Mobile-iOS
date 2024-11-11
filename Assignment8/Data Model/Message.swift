//
//  Conversation.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import Foundation

enum MessageSender {
    case me
    case other
}

struct Message {
    var text: String
    var sender: MessageSender
    
}
