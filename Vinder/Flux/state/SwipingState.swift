//
//  SwipingState.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux


struct SwipingState: FluxState {
    var isPlaying: Bool = true
    var profilesToSwipe = [MatchProfile]()
    var firstProfil: MatchProfile? {
        return profilesToSwipe.first
    }
}
