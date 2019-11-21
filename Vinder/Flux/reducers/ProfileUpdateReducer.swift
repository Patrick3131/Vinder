//
//  ProfileUpdateReducer.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

func profileUpdateStateReducer(state: ProfileUpdateState, action: Action) -> ProfileUpdateState {
    var state = state
    switch action {
    case let action as ProfileUpdateActions.UploadStatus:
        state.imageUploadStatus = action.status
    case let action as ProfileUpdateActions.ShowImagePicker:
        state.showImagePicker = action.show
    case let action as ProfileUpdateActions.ShowRecordingDetailView:
        state.showRecordingDetailView = action.show
    default:
        break
    }
    return state
}
