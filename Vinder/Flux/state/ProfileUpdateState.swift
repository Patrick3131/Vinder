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
    var imageUploadStatus: ImageProcessingStatus = .nothingHappendSoFar
    var imageDeleteStatus: ImageProcessingStatus = .nothingHappendSoFar
    
    enum ImageProcessingStatus {
        case imageIsProcessing(index: Int)
        case imageProcessingFailed(index: Int)
        case nothingHappendSoFar
    }
}
