//
//  MatchProfile.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct MatchProfile {
    var profile: Profile
    var startedConversation: Bool = false
    var conversations: Conversation?
    
    enum Status {
        case new
        case thisProfilLikesOwner
        case likedByOwner
        case match
    }
}
