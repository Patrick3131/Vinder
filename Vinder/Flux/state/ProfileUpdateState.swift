//
//  UpdateProfileState.swift
//  Vinder
//
//  Created by Patrick Fischer on 13.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct ProfileUpdateState: FluxState {
    var showImagePicker: Bool = false
    var imageUploadStatus: ImageProcessingStatus = .isReady
    var imageDeleteStatus: ImageProcessingStatus = .isReady
    
    var audioStatus = AudioStatus.nothingIsHappening

    enum AudioStatus {
        case nothingIsHappening
        case recording
        case stopRecording
        case uploading
        case delete
        case playing
    }
   
}



