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
    
    
    func profilUpdates(id: String, updates: [ProfileUpdate], completion: @escaping (Result<Bool,Error>) -> Void) {
        for update in updates {
            profilUpdate(id: id, update: update, completion: { result in
                completion(result)
//                completion(completion)
            })
        }
    }
    
    func profilUpdate(id: String,update: ProfileUpdate, completion: @escaping (Result<Bool,Error>) -> Void) {
        switch update {
        case .newComplete(_):
            createProfil(id: id, data: convertToDictionary(update), completion: { result in
                completion(result)
            })
        default:
            updateProfil(id: id, data: convertToDictionary(update), completion: { result in
                completion(result)
            })
        }
    }
    
    private func updateProfil(id: String, data: [String: Any], completion: @escaping (Result<Bool,Error>) -> Void) {
        db.collection(dbName).document(id).setData(data, merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
                
                completion(.failure(error))
            } else {
                print("Document", id, data, "successfully written")
                completion(.success(true))
            }
        }
    }
    
    private func createProfil(id: String, data: [String: Any], completion: @escaping (Result<Bool,Error>) -> Void) {
        db.collection(dbName).document(id).setData(data, merge: false) { error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                print("Document", id, data, "successfully written")
                completion(.success(true))
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
        case .id:
            return [:]
        case let .newComplete(profil):
            return [
                Keys.name.rawValue : profil.name,
                Keys.age.rawValue : profil.age!.timeIntervalSince1970,
                Keys.gender.rawValue : profil.gender.rawValue,
                Keys.preference.rawValue : profil.preference.rawValue,
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
                Keys.pictureUrls.rawValue : urls.map { $0.absoluteString}
            ]
        case let .biography(url: url):
            return [
                Keys.biography.rawValue : url.absoluteString
            ]
        case let.location(location: location):
            return [
                Keys.location.rawValue : locationFormatting(location)!
            ]
        }
    }
    
}
