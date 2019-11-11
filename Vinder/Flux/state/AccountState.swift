//
//  AccountState.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct AccountState:FluxState {
    var profile: Profile?
    var userUID: String?
    var loggedIn: Bool = false
    var didUserAlreadyCreateACompleteProfile: Bool = false
}


