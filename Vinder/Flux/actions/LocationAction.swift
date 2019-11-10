//
//  LocationAction.swift
//  Vinder
//
//  Created by Patrick Fischer on 07.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUIFlux

enum LocationAction: Action {
    case trackLocation(userId: String)
    case setLocation(location: CLLocation)
}

