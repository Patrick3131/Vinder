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
    
    func convertToDictionary() -> [String: Any] {
        switch self {
        case let .inital(profil):
            return [
                Properties.name.rawValue : profil.name,
                Properties.age.rawValue : profil.age.timeIntervalSince1970,
                Properties.gender.rawValue : profil.gender.rawValue,
                Properties.preference.rawValue : profil.preference.rawValue,
                Properties.pictureUrls.rawValue : profil.pictureUrl,
                Properties.biography.rawValue : profil.biography as Any,
                Properties.location.rawValue : (profil.location != nil) ? [
                    "latitude" : profil.location?.coordinate.latitude.binade,
                    "longitude" : profil.location?.coordinate.longitude.binade
                    ] : nil
            ]
        case let .name(name: name):
            return [
                Properties.name.rawValue : name
            ]
        case let .age(age: date):
            return [
                Properties.age.rawValue : date.timeIntervalSince1970
            ]
        case let .gender(gender: gender):
            return [
                Properties.gender.rawValue : gender.rawValue
            ]
        case let .preference(preference: preference):
            return [
                Properties.preference.rawValue : preference.rawValue
            ]
        case let .prictureUrl(urls: urls):
            return [
                Properties.pictureUrls.rawValue : urls
            ]
        case let .biography(url: url):
            return [
                Properties.biography.rawValue : url
            ]
        case let.location(location: location):
            return [
                Properties.location.rawValue : [
                    "latitude" : location.coordinate.latitude.binade,
                    "longitude" : location.coordinate.longitude.binade
                ]
            ]
        }
    }
}
