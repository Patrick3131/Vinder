//
//  MiddlewareProvider.swift
//  Vinder
//
//  Created by Patrick Fischer on 07.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

protocol MiddlewareProvider {
    func provideMiddleware() -> [Middleware<FluxState>]
}
