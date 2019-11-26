//
//  MediumType.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

enum MediumType: DataServiceConfig {
    case image
    case biography
    case message
    
    var path: String {
        switch self {
        case .image:
            return "image"
        case .biography:
            return "biography"
        case .message:
            return "message"
        }
    }
    
    var contentType: String {
        switch self {
        case .image:
           return "image/jpeg"
        case .biography:
           return "audio/mp3"
        case .message:
            return "audio"
        }
    }
}
