//
//  AppState.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct AppState: FluxState {
    var accountState: AccountState
    var authenticationState: AuthentificationState
    var swipingState: SwipingState
    init() {
        self.accountState = AccountState()
        self.authenticationState = AuthentificationState()
        self.swipingState = SwipingState()
    }
}
