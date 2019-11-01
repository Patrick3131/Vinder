//
//  FirebaseProfilUpdater.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct FirebaseProfilUpdater: ProfilUpdateNetworking {
    
    private var db: Firestore
    private var dbName = "users"
    
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
            createProfil(id: id, data: update.convertToDictionary(), completionHandler: { completion in
                completionHandler(completion)
            })
        default:
            updateProfil(id: id, data: update.convertToDictionary(), completionHandler: { completion in
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
}
