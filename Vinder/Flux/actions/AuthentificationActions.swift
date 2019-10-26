//
//  AuthentificationActions.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux
import FirebaseAuth


struct AuthentificationActions {
    
    struct Listen: AsyncAction {
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let handle = Auth.auth().addStateDidChangeListener {  (auth, user) in
                    if let user = user {
                        dispatch(AccountActions.AuthentificationAction(isLoggedIn: true, userUID: user.uid))
                    }  else {
                        dispatch(AccountActions.AuthentificationAction(isLoggedIn: false, userUID: nil))
                    }
            }
            dispatch(SetListener(handle: handle))
        }
    }
    
    struct StopListen: AsyncAction {
        let handle: AuthStateDidChangeListenerHandle?
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            if let handle = handle {
                Auth.auth().removeStateDidChangeListener(handle)
                dispatch(SetListener(handle: nil))
            }
        }
    }
    
    struct SetListener: Action {
        let handle: AuthStateDidChangeListenerHandle?
    }
    
}
