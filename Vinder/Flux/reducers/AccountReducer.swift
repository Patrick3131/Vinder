//
//  AccountReducer.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux


func accountStateReducer(state: AccountState, action: Action) -> AccountState {
    var state = state
    switch action {
    case let action as AccountActions.SetLogin:
        state.loggedIn = action.isLoggedIn
        state.userUID = action.userUID
    case let action as AccountActions.SetProfil:
        state.profile = action.profil
    case let action as ProfileUpdateActions.SetName:
        state.profile?.name = action.name
    case let action as ProfileUpdateActions.SetImageUrl:
        state.profile?.pictureUrl.append(action.url)
    case let action as ProfileUpdateActions.SetBioUrl:
        state.profile?.biography = action.url
    case let action as ProfileUpdateActions.SetGender:
        state.profile?.gender = action.gender
    case let action as ProfileUpdateActions.SetPreference:
        state.profile?.preference = action.preference
    case let action as ProfileUpdateActions.RemoveImageState:
        state.profile?.pictureUrl.remove(at: action.imageIndex)
    case let action as LocationAction:
        switch action {
        case .setLocation(location: let location):
            state.profile?.location = location
            
        default: break
            
        }
    default:
        break
    }
    return state
}


