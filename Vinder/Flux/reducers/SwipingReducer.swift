//
//  SwipingReducer.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

func swipingStateReducer(state: SwipingState, action: Action) -> SwipingState {
    var state = state
    switch action {
        
    case let action as SwipingActions.PopFirstProfile:
        state.profiles.removeValue(forKey: action.id)
        _ = state.profilesToSwipe.removeFirst()
    case let action as AccountActions.SetLogin:
        break
    case let action as AccountActions.SetProfil:
        break
    default:
        break
    }
    return state
}

func profileUpdateStateReducer(state: ProfileUpdateState, action: Action) -> ProfileUpdateState {
    var state = state
    switch action {
    case let action as ProfileUpdateActions.UploadStatus:
        state.imageUploadStatus = action.status
    case let action as ProfileUpdateActions.ShowImagePicker:
        state.showImagePicker = action.show
    default:
        break
    }
    return state
}
