//
//  Authentication.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

protocol Authentication {
    func login(email: String, password: String, completion: @escaping (Error?) -> Void)
    func registerUser(email: String, password: String, completion: @escaping (Error?) -> Void)
    func resetPassword(email: String, completion: @escaping (Error?) -> Void)
    func logout(completion: @escaping (_ successful: Bool, _ error: Error?) -> Void)
    func sendEmailVerification(completion: @escaping (Error?) -> Void)
    
}
