//
//  AudioRecorder.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import AVFoundation



class AudioRecorder: NSObject {
    
    private var audioRecorder: AVAudioRecorder?
    private var audioFileName: URL?
    private var interruptedRecording = false
    private var isRecording = false
    
    var newRecording: ((Result<URL,Error>) -> ())?
    
    
    /// completion returns url
    func record(name: String)  {
        checkMicPermission(completion: { result in
            switch result {
            case .success(let permission):
                if permission {
                    self.audioFileName = self.createURL(name)
                    self.recording()
                }
                
            case .failure(let error):
                
                print(error)
            }
            
        })
    }
    
    
    func stop() {
        audioRecorder?.stop()
    }
    
    private func createURL(_ name: String) -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url = paths[0]
        url.appendPathComponent(name)
        return url
//        return paths[0].appendPathComponent(name)
    }
    
    private func finishRecording(successful: Bool) {
        if successful {
            if let url = audioFileName {
                
                newRecording?(.success(url))
                audioFileName = nil
                
            }
        } else {
            audioFileName = nil
        }
    }
    
    private func recording() {
        do {
            if let url = audioFileName {
                
                audioRecorder = try AVAudioRecorder(url: url, settings: audioSettings())
                audioRecorder?.delegate = self
                audioRecorder?.record()
            }
//            audioRecorder
        } catch let error {
            
            print(error.localizedDescription)
        }
    }
    
    func audioSettings() -> [String: Any] {
        [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
         AVSampleRateKey: 12000,
         AVNumberOfChannelsKey: 1,
         AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
    }
    
    private enum PermissionError: LocalizedError {
        case permissionDenied
    }
    private func checkMicPermission(completion: @escaping (Result<Bool,PermissionError>) -> Void) {
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

extension AudioRecorder: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        finishRecording(successful: flag)
    }
}



