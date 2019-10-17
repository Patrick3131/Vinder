//
//  FirebaseAuthentication.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import FirebaseAuth

struct FirebaseAuthentication: Authentication {
    func login(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            completion(error)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user,error) in
            completion(error)
        }
    }
    
    func logout(completion: @escaping (Bool, Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch (let error) {
            print(error.localizedDescription)
            completion(false, error)
        }
    }
    
    func sendEmailVerification(completion: @escaping (Error?) -> Void) {
        Auth.auth().currentUser?.sendEmailVerification() { (error) in
            completion(error)
        }
    }
    
    
}
