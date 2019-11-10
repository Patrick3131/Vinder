//
//  FirebaseMiddleware.swift
//  Vinder
//
//  Created by Patrick Fischer on 02.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux
import FirebaseAuth

let firebaseMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            switch action {
            case let action as AccountActions.Authenticate:
                let handle = Auth.auth().addStateDidChangeListener {  (auth, user) in
                    if let user = user {
                        return next(AccountActions.AuthentificationAction(isLoggedIn: true, userUID: user.uid))
                    }  else {
                        return next(AccountActions.AuthentificationAction(isLoggedIn: false, userUID: nil))
                    }
                }
            default:
                return next(action)
            }
        }
    }
}

