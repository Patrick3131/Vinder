//
//  AudioPlayer.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import AVFoundation


class AudioPlayer: NSObject, AudioPlaying {
    
    private var audioPlayer:AVAudioPlayer?
    
    private var isPlaying = false
    var playing: ((Result<Bool,Error>) -> ())?

    func play(data: Data) {
        do {
            audioPlayer = try AVAudioPlayer(data: data)
            if let audioPlayer = audioPlayer {
                audioPlayer.delegate = self
                audioPlayer.play()
            }
        } catch let error {
            playing?(.failure(error))
            print(error.localizedDescription)
        }
    }
    
    func stop() {
        if let audioPlayer = audioPlayer {
            audioPlayer.stop()
        }
    }
}

extension AudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playing?(.success(flag))
    }
}
