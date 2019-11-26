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
    var preference: Preference = .female
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
        
        func index() -> Int {
            switch self {
            case .male:
                return 0
            case .female:
                return 1
            }
        }
    }
    
    enum Preference: String {
        case female
        case male
        case both
        case friendship
        
        static func getPreference(index: Int) -> Preference {
            switch index {
            case 0:
                return female
            case 1:
                return male
            case 2:
                return both
            case 3:
                return friendship
            default:
                return female
            }
        }
        
        func index() -> Int {
            switch self {
            case .female:
                return 0
            case .male:
                return 1
            case .both:
                return 2
            case .friendship:
                return 3
            }
        }
    }
    
    static var preDataAccount: Profile = Profile(id: "1", name: "Patrick", age: Date(), gender: .male, preference: .female, pictureUrl: [URL](), biography: nil)
    
    func getLocation() {
        let location = CLLocationManager()
        location.location
        self.location?.coordinate.latitude.binade
        self.location?.coordinate.longitude
    }
}




