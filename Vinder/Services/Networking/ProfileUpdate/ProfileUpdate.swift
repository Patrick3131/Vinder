//
//  ProfileUpdate.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import CoreLocation

enum ProfileUpdate {
    case inital(profile: Profile)
    case name(name: String)
    case age(age: Date)
    case gender(gender: Profile.Gender)
    case preference(preference: Profile.Preference)
    case prictureUrl(urls: [URL])
    case biography(url: URL)
    case location(location:CLLocation)
    
    enum Properties: String {
        case name
        case age
        case gender
        case preference
        case pictureUrls
        case biography
        case location
    }
}
