//
//  MatchViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 06.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import Foundation

struct MatchViewModel {
    var profile: Profile
    
    var city: String {
        return "Munich"
    }
    
    var age: String {
        return "25"
    }
    
    var name: String {
        return profile.name ?? ""
    }
    
    var pictureUrl: URL {
        return URL(string: "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/media%2FRPTujanhFfc3zVLaKoPXvqXb8WH37?alt=media&token=9afc87af-d8be-4bce-8219-c808f44a5f9b")!
    }
}
