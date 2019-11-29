//
//  AddBioViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct AddBioViewModel {
    var tabbed: (ProfileUpdateState.AudioStatus) -> Void
    
    var isBioAvailable: Bool
    
    func delete() {
        tabbed(.delete)
    }
    
    func record() {
        tabbed(.recording)
    }
    
    func stopRecording() {
        tabbed(.stopRecording)
    }
    
    func play() {
        tabbed(.playing)
    }
    
}
