//
//  AudioRecording.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

//https://www.blckbirds.com/post/voice-recorder-app-in-swiftui-1

protocol AudioRecording {
    func record()
    func stop()
}
