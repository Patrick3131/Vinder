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
    var isPlaying: Bool = false
    var profiles = [String:MatchProfile]()
    var profilesToSwipe = [String]()
    var firstProfil: MatchProfile? {
        if let first = profilesToSwipe.first {
            return profiles[first]
        } else {
            return nil
        }
    }
    
    init() {
        profilesToSwipe = ["0","1","2","3"]
    }
}
