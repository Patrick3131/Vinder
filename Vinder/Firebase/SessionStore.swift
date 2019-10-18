//
//  SessionStore.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import Combine
import FirebaseAuth

class SessionStore: ObservableObject {
    @Published var session: Account?
    var handle: AuthStateDidChangeListenerHandle?
    
    deinit {
        stopListen()
    }
    
    func listen() {
        if handle == nil {
            handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
                if let strongSelf = self {
                    if let user = user {
                        print("User logged in: \(user)")
                        strongSelf.session = Account.preData
                    }  else {
                        strongSelf.session = nil
                    }
                }
            }
        }
    }
    
    func stopListen() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
