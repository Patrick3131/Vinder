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
    var conversation: Conversation?
    var status: Status = .new
    
    enum Status {
        case new
        case thisProfilLikesOwner
        case likedByOwner
        case match
    }
    
    static var preDataAccount: MatchProfile = MatchProfile(profile: Profile.preDataAccount)
}
