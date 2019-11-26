//
//  AudioPlayer.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import AVFoundation


struct AudioPlayer {
    
    private var audioPlayer:AVAudioPlayer?
    
    private var isPlaying = false
    
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
