//
//  MatchProfile.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct MatchProfile: Identifiable {
    var id = UUID()
    
    var profile: Profile
    var startedConversation: Bool = false
    var conversation: Conversation?
    var status: Status = .new
    
    
    enum Status {
        case new
        case thisProfilLikesOwner(date: Date)
        case likedByOwner(date: Date)
        case match(date: Date)
    }
    
    static var preDataAccount: MatchProfile = MatchProfile(profile: Profile.preDataAccount)
    static var pre1: MatchProfile = MatchProfile(profile: Profile.preDataAccount)
    static var pre2: MatchProfile = MatchProfile(profile: Profile.preDataAccount)
    static var pre3: MatchProfile = MatchProfile(profile: Profile.preDataAccount)
}
