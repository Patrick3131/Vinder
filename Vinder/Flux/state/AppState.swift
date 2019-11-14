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
    var swipingState: SwipingState
    var profileUpdateState: ProfileUpdateState
    init() {
        self.accountState = AccountState()
        self.swipingState = SwipingState()
        self.profileUpdateState = ProfileUpdateState()
    }
}
