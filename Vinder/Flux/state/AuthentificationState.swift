//
//  AuthentificationState.swift
//  Vinder
//
//  Created by Patrick Fischer on 25.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux
import FirebaseAuth


struct AuthentificationState: FluxState {
    var handle: AuthStateDidChangeListenerHandle?
}
