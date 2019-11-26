//
//  AccountActions.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux
import FirebaseAuth

struct AccountActions {
    
    struct Logout: AsyncAction {
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            try? Auth.auth().signOut()
        }
    }
    
    struct Authenticate: Action {}
    
    struct AuthentificationAction: AsyncAction {
        let isLoggedIn: Bool
        let userUID: String?
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
                dispatch(SetLogin(isLoggedIn: isLoggedIn, userUID: userUID))
            
        }
    }

    struct SetLogin: AsyncAction {
        var isLoggedIn: Bool
        var userUID: String?
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            if isLoggedIn && userUID != nil {

                dispatch(ReadProfil(userUID: userUID!))
            }
        }
    }
    
    
    struct ReadProfil: AsyncAction {
        var userUID: String
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let firebase = FirebaseProfileReader()
            
            firebase.profileRead(id: userUID, completion: { result in
                switch result {
                case .success(let profile):
                    dispatch(SetProfil(profil: profile))
                case .failure(let error):
                    if let error = error as? FirebaseProfileReader.FirebaseError {
                        switch error {
                        case .profilDoesNotExist:
                            dispatch(CreateInitialProfil(userUID: self.userUID))
                        default:
                            break
                        }
                    }
                }
            })
        }
    }
    
    struct CreateInitialProfil: AsyncAction {
        var userUID: String
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let firebase = FirebaseProfilUpdater()
            firebase.profilUpdate(id: userUID, update: .id(userUID), completionHandler: { success in
                if success {
                    dispatch(ReadProfil(userUID: self.userUID))
                }
            })
        }
        
        
    }
    
    
    struct CreateProfil: AsyncAction {
        let profile: Profile
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let firebase = FirebaseProfilUpdater()
            firebase.profilUpdate(id: profile.id, update: .newComplete(profile: profile), completionHandler: { success in
                if success {
                    dispatch(SetProfil(profil: self.profile))
                }
            })
        }
    }
    
    struct SetProfil: Action {
        let profil: Profile?
    }
    
    
}
