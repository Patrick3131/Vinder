//
//  AuthFirebaseListener.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Combine
import FirebaseAuth

class AuthFirebaseListener {
    var handle: AuthStateDidChangeListenerHandle?
    
    deinit {
        stopListen()
    }
    
    func listen() {
        if handle == nil {
            handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
                if let _ = self {
                    if let user = user {
                        store.dispatch(action: AccountActions.AuthentificationAction(isLoggedIn: true, userUID: user.uid))
                    }  else {
                        store.dispatch(action: AccountActions.AuthentificationAction(isLoggedIn: false, userUID: nil))
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
