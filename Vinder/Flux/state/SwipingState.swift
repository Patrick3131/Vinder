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
    var profiles = [Int:MatchProfile]()
    var profilesToSwipe = [Int]()
    var firstProfil: MatchProfile? {
        if let first = profilesToSwipe.first {
            return profiles[first]
        } else {
            return nil
        }
    }
}
