//
//  FirebaseProfileReader.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import FirebaseFirestore
import CoreLocation

struct FirebaseProfileReader: ProfileReading {
    typealias Keys = ProfileUpdate.Properties
    private var db: Firestore
    private var dbName = FirebaseConstants.dbUsers
    
    init() {
        self.db = Firestore.firestore()
    }
    func profileRead(id: String, completion: @escaping (Result<Profile, Error>) -> Void) {
        db.collection(dbName).document(id).getDocument(completion: { (document, error) in
            
            if let error = error {
                print(error)
                completion(.failure(error))
            } else {
                do {
                    
                    let decoded = try self.decodeDictionary(document: document)
                    completion(.success(decoded))
                } catch let error {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    
    func profileReads(ids: [String], completion: @escaping (Result<[Profile], Error>) -> Void) {
        
    }
    
    enum FirebaseError: LocalizedError {
        case decodingFailed
        case name
        case age
        case gender
        case preference
        case picture
        case biography
        case location
        case profilDoesNotExist
        
        var errorDescription: String {
            let failed = " decoding failed"
            switch self {
            case .decodingFailed:
                return failed
            case .name:
                return "name" + failed
            case .age:
                return "age" + failed
            case .gender:
                return "gender" + failed
            case .preference:
                return "preference" + failed
            case .picture:
                return "picture" + failed
            case .biography:
                return "biography" + failed
            case .location:
                return "location" + failed
            case .profilDoesNotExist:
                return "profilDoesNotExist"
            }
        }
    }
    
    private func decodeDictionary(document: DocumentSnapshot?) throws -> Profile  {
        
        guard let value = document?.data() else { throw FirebaseError.profilDoesNotExist}
        
        print(value)
        
        let name = value[Keys.name.rawValue] as? String
        let age = value[Keys.age.rawValue] as? Double ?? 0.0
        let gender = value[Keys.gender.rawValue] as? String
        let preference = value[Keys.preference.rawValue] as? String
        
        let pictureURL = (value[Keys.pictureUrls.rawValue] as? [String])?.compactMap {
            return URL(string: $0)
        }
        
        let location = value[Keys.location.rawValue] as? GeoPoint
        var biography: URL?
        if ((value[Keys.biography.rawValue] as? String) != nil) {
            biography = URL(string: value[Keys.biography.rawValue] as! String)

        }
//        let biography = value[Keys.biography.rawValue] as? URL
        
        
        /*
         In Production there should be only user with non nil locations be recieved
         */
        var cllocation: CLLocation?
        if let location = location {
            cllocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        }
        
        let profile = Profile(id: document!.documentID,
                              name: name,
                              age: Date(timeIntervalSince1970: age),
                              gender: Profile.Gender(rawValue: gender ?? "male") ?? .male ,
                              preference: Profile.Preference(rawValue: preference ?? "hetero") ?? .female,
                              pictureUrl: pictureURL ?? [URL]() ,
                              biography: biography,
                              location: cllocation)
        
        return profile
    }
    
}
