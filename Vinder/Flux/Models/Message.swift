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
    enum Status {
        case recieved
        case sending
        case failed
        case sent
        case recording
    }
}
