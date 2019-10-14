//
//  Conversation.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct Conversation {
    var lastContact: Date
    var messagesRecieved: [Message]
    var messagesSent: [Message]
}
