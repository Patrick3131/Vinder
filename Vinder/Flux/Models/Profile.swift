//
//  Profil.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import CoreLocation
import FirebaseFirestore

struct Profile: Identifiable {
    var id: String
    var name: String?
    var age: Date?
    var gender: Gender = .male
    var preference: Preference = .hetero
    var pictureUrl: [URL]
    var biography: URL?
    var location: CLLocation?
    
    
    enum Gender: String {
        case male
        case female

        static func getGender(index: Int) -> Gender {
            switch index {
            case 0:
                return male
            case 1:
                return female
            default:
                return male
            }
        }
    }
    
    enum Preference: String {
        case hetero
        case gay
        case bi
        case friendship
        
        static func getPreference(index: Int) -> Preference {
            switch index {
            case 0:
                return hetero
            case 1:
                return gay
            case 2:
                return bi
            case 3:
                return friendship
            default:
                return hetero
            }
        }
    }
    
    static var preDataAccount: Profile = Profile(id: "1", name: "Patrick", age: Date(), gender: .male, preference: .hetero, pictureUrl: [URL](), biography: nil)
    
    func getLocation() {
        let location = CLLocationManager()
        location.location
        self.location?.coordinate.latitude.binade
        self.location?.coordinate.longitude
    }
}




