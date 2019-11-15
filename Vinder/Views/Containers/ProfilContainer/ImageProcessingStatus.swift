//
//  ImageProcessingStatus.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

enum ImageProcessingStatus {
    case imageIsProcessing(index: Int)
    case imageProcessingFailed(index: Int)
    case isReady
}
