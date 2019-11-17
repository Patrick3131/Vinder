//
//  FirebaseProfilUpdater.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import FirebaseFirestore
import CoreLocation


struct FirebaseProfilUpdater: ProfilUpdating {
    
    typealias Keys  = ProfileUpdate.Properties
    
    private var db: Firestore
    private var dbName = FirebaseConstants.dbUsers
    
    init() {
        self.db = Firestore.firestore()
    }
    
    
    func profilUpdates(id: String, updates: [ProfileUpdate], completionHandler: @escaping (Bool) -> Void) {
        for update in updates {
            profilUpdate(id: id, update: update, completionHandler: { completion in
                completionHandler(completion)
            })
        }
    }
    
    func profilUpdate(id: String,update: ProfileUpdate, completionHandler: @escaping (Bool) -> Void) {
        switch update {
        case .inital(_):
            createProfil(id: id, data: convertToDictionary(update), completionHandler: { completion in
                completionHandler(completion)
            })
        default:
            updateProfil(id: id, data: convertToDictionary(update), completionHandler: { completion in
                completionHandler(completion)
            })
        }
    }
    
    private func updateProfil(id: String, data: [String: Any], completionHandler: @escaping (Bool) -> Void) {
        db.collection(dbName).document(id).setData(data, merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(false)
            } else {
                print("Document", id, data, "successfully written")
                completionHandler(true)
            }
        }
    }
    
    private func createProfil(id: String, data: [String: Any], completionHandler: @escaping (Bool) -> Void) {
        db.collection(dbName).document(id).setData(data, merge: false) { error in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(false)
            } else {
                print("Document", id, data, "successfully written")
                completionHandler(true)
            }
        }
    }
    
    private func locationFormatting(_ location: CLLocation?) -> GeoPoint? {
        if let location = location {
            return GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        } else {
            return nil
        }
    }
    
    private func convertToDictionary(_ profilUpdate:ProfileUpdate) -> [String: Any] {
        switch profilUpdate {
        case let .inital(profil):
            return [
                Keys.name.rawValue : profil.name,
                Keys.age.rawValue : profil.age!.timeIntervalSince1970,
                Keys.gender.rawValue : profil.gender!.rawValue,
                Keys.preference.rawValue : profil.preference!.rawValue,
                Keys.pictureUrls.rawValue : profil.pictureUrl,
                Keys.biography.rawValue : profil.biography as Any,
                Keys.location.rawValue : locationFormatting(profil.location) as Any
            ]
        case let .name(name: name):
            return [
                Keys.name.rawValue : name
            ]
        case let .age(age: date):
            return [
                Keys.age.rawValue : date.timeIntervalSince1970
            ]
        case let .gender(gender: gender):
            return [
                Keys.gender.rawValue : gender.rawValue
            ]
        case let .preference(preference: preference):
            return [
                Keys.preference.rawValue : preference.rawValue
            ]
        case let .prictureUrl(urls: urls):
            return [
                Keys.pictureUrls.rawValue : urls
            ]
        case let .biography(url: url):
            return [
                Keys.biography.rawValue : url
            ]
        case let.location(location: location):
            return [
                Keys.location.rawValue : locationFormatting(location)!
            ]
        }
    }
    
}
