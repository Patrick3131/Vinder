//
//  PreviewMessageViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import Foundation

struct PreviewMessageViewModel {
    var pictureUrl: URL {
        let string = "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/pictures%2Funnamed.jpg?alt=media&token=4742954b-3820-453c-be73-ba01f1b9fe5e"
        return URL(string: string)!
    }
    
    var age: String {
        "\(24)"
    }
}
