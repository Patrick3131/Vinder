//
//  RecordBioAudio.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUI
/// View a biography has been recorded
struct RecordBioAudio: View {
    var record: () -> Void
    var delete: () -> Void
    var play: () -> Void
    
    @GestureState var isMicPressed = false
    
    enum Recording {
        case recording
        case stopRecording
        
    }
    
    
    
    var body: some View {
        let recordGesture = LongPressGesture(minimumDuration: 1.0, maximumDistance: 1.0).updating($isMicPressed, body: { currenState, gestureState, transaction in
            gestureState = currenState
            }).onEnded{ value in
                print(value)
                
            }
        return HStack {
            Button(action: {
                self.delete()
            }, label: {
                Image(systemName: "trash")
            }).padding()
            Button(action: {
                self.record()
                }
                , label: {
                    Image(systemName: "mic")
                })
                .gesture(recordGesture)
                .padding()
            Button(action: {
                self.play()
            }, label: {
                Image(systemName: "play.circle")
            }).foregroundColor(isMicPressed ? Color.green : .yellow)
                .padding()
        }
    }
}
