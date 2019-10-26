//
//  AuthenticationReducer.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux


func authenticationStateReducer(state: AuthentificationState, action: Action) -> AuthentificationState {
    var state = state
    switch action {
    case let action as AuthentificationActions.SetListener:
        state.handle = action.handle
    default:
        break
    }
    return state
}
