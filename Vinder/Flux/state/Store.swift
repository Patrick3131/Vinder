//
//  Store.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux


let store = Store<AppState>(reducer: appStateReducer, middleware:[loggingMiddleware,firebaseMiddleware], state: AppState())
