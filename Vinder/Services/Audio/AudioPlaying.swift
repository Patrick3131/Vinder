//
//  AudioPlaying.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

protocol AudioPlaying {
    var playing: ((Result<Bool,Error>) -> ())? { get set}
    func play(data: Data)
    func stop()
}
