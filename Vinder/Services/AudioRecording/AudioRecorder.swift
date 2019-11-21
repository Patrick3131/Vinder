//
//  AudioRecorder.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import AVFoundation

//https://www.blckbirds.com/post/voice-recorder-app-in-swiftui-1

protocol AudioRecording {
    func record()
    func stop()
}

struct AudioRecorder {
    
    
    private enum Error: LocalizedError {
        case permissionDenied
    }
    private func chechMicPermission(completion: @escaping (Result<Bool,Error>) -> Void) {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .granted:
            completion(.success(true))
        case .denied:
            completion(.failure(.permissionDenied))
        case .undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                if granted {
                    completion(.success(true))
                } else {
                    completion(.failure(.permissionDenied))
                }
                
            }
        @unknown default:
            break
        }
    }
}

protocol AudioPlaying {
    func play()
    func stop()
}

struct AudioPlayer {
    
    private var audioPlayer:AVAudioPlayer?
    
    mutating func play(data: Data) {
        do {
            audioPlayer = try AVAudioPlayer(data: data)
            if let audioPlayer = audioPlayer {
                audioPlayer.play()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stop() {
        if let audioPlayer = audioPlayer {
            audioPlayer.stop()
        }
    }
}
