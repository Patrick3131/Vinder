//
//  Profil.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct Profile: Identifiable {
    var id: Int
    var name: String
    var age: Date
    var gender: Gender
    var preference: Preference
    var pictureUrl: [URL]
    
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
}
