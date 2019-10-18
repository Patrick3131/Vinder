//
//  Profil.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct Profile: Identifiable {
    var id: String
    var name: String
    var age: Date
    var gender: Gender
    var preference: Preference
    var pictureUrl: [URL]
//    var biography: VoiceMessage
    
    enum Gender {
        case female
        case male
    }
    
    enum Preference {
        case hetero
        case gay
        case bi
        case friendship
    }
    
    static var preDataAccount: Profile = Profile(id: "1", name: "Patrick", age: Date(), gender: .male, preference: .hetero, pictureUrl: [URL]())
}
