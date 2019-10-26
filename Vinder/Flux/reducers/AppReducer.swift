//
//  AppReducer.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

func appStateReducer(state: AppState, action: Action) -> AppState {
    var state = state
    state.accountState = accountStateReducer(state: state.accountState, action: action)
    state.authenticationState = authenticationStateReducer(state: state.authenticationState, action: action)
    return state
}
