//
//  Conversation.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct Conversation: Identifiable {
    var id: Int
    var lastContact: Date? {
        guard (messagesSent.last != nil) && (messagesRecieved.last != nil) else { return nil}
        return max(messagesSent.last!.date, messagesRecieved.last!.date)
        
    }
    var messagesRecieved: [Message]
    var messagesSent: [Message]
}



