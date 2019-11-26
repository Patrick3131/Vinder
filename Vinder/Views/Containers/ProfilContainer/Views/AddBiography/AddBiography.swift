//
//  AddBiography.swift
//  Vinder
//
//  Created by Patrick Fischer on 18.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

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

struct AddBiography: View {
    var viewModel: AddBioViewModel
    var body: some View {
        VStack {
            Text("Tell something about yourself:")
            Group {
                if viewModel.isBioAvailable {
                    RecordBioAudio(record: {
                        self.viewModel.record()
                    }, delete: {
                        self.viewModel.delete()
                    }, play: {
                        self.viewModel.play()
                    })
                } else {
                    BioView(record: {
                        self.viewModel.record()
                    })
                }
            }
        }
        
    }
}


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


//View mit Audio Icon (waveform) und einem Delete(trash), Record(mic) & Play (play.circle) Button
/// View a biography has not been recorded yet
struct BioView: View {
    var record: () -> Void
    var body: some View {
        Button(action: {
            self.record()
        }, label: {
            Image(systemName: "mic")
        }).padding(.bottom, 8)
    }
}

struct AddBiography_Previews: PreviewProvider {
    static var previews: some View {
        AddBiography(viewModel: AddBioViewModel(tabbed: { _ in
            
        }, isBioAvailable: true))
    }
}
