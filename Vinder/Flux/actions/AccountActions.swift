//
//  AccountActions.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct AccountActions {
    
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
            dispatch(GetPublicProfil(userUID: ""))
        }
        
        
    }

    
    struct GetPublicProfil: AsyncAction {
        var userUID: String
        
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            dispatch(SetProfil(profil: Profile.preDataAccount))
        }
    }
    
    struct CreateProfil: AsyncAction {
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            
        }
    }

    struct SetProfil: Action {
        let profil: Profile
    }

    
}
