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
    
    func profileRead(id: String, completionHandler: @escaping (Profile, Error?) -> Void) {
        db.collection(dbName).document(id).getDocument(completion: { (document, error) in
            if let error = error {
                completionHandler(Profile.preDataAccount, error)
            } else {
                do {
                    let decoded = try self.decodeDictionary(document: document)
                    completionHandler(decoded,nil)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    func profileReads(ids: [String], completionHandler: @escaping (Profile, Error?) -> Void) {
        
    }
    
    enum FirebaseError: String, LocalizedError {
        case decodingFailed
        case name = "name decoding failed"
        case age = "age decoding failed"
        case gender = "gender decoding failed"
        case preference
        case picture
        case biography = "ef"
        case location
        
        case dataNil
    }
    
//
//    var id: String
//    var name: String
//    var age: Date
//    var gender: Gender
//    var preference: Preference
//    var pictureUrl: [URL]
//    var biography: URL?
//    var location: CLLocation?
    
    func decodeDictionary(document: DocumentSnapshot?) throws -> Profile  {
        
        guard let value = document?.data() else { throw FirebaseError.dataNil}
        print(value)
        guard let name = value[Keys.name.rawValue] as? String else { throw FirebaseError.name}
        guard let age = value[Keys.age.rawValue] as? Double else { throw FirebaseError.age}
        guard let gender = value[Keys.gender.rawValue] as? String else { throw FirebaseError.gender}
        guard let preference = value[Keys.preference.rawValue] as? String else { throw FirebaseError.preference}
        guard let pictureURL = value[Keys.pictureUrls.rawValue] as? [URL]? else { throw FirebaseError.picture}
        guard let biography = value[Keys.biography.rawValue] as? URL? else { throw FirebaseError.biography}
        guard let location = value[Keys.location.rawValue] as? GeoPoint else { throw FirebaseError.location }
        
        let profile = Profile(id: document!.documentID,
                              name: name,
                              age: Date(timeIntervalSince1970: age),
                              gender: Profile.Gender(rawValue: gender)!,
                              preference: Profile.Preference(rawValue: preference)!,
                              pictureUrl: pictureURL ?? [URL]() ,
                              biography: biography,
                              location: CLLocation(latitude: CLLocationDegrees(exactly: location.latitude)!, longitude: CLLocationDegrees(exactly: location.longitude)!))
        
        return profile
    }
    
}
