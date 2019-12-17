//
//  Account.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation


struct Account {
    var profile: Profile
    var loggedIn: Bool
    var matches: [MatchProfile]
    var profilesToSwipe: [MatchProfile]
    
    
    // range Location
    // range Age
    
    
    static var preData: Account = Account(profile: Profile.preDataAccount, loggedIn: false, matches: [MatchProfile.preDataAccount], profilesToSwipe: [MatchProfile.preDataAccount])
}


