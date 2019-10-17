//
//  Message.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct Message: Identifiable {
    var id: Int
    var date: Date
    var status: Status
    var sentByOwner: Bool
//    var audio:
    
    enum Status {
        case recieved
        case sending
        case failed
        case sent
        case recording
        case listend
    }
}
