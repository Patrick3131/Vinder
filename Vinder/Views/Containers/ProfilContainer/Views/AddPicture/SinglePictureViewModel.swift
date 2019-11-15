//
//  SinglePictureViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

struct SinglePictureViewModel {
    let picture: URL?
    let onTab: (Tabbed) -> Void
    var isActivitySpinnerActivated = false
    func addPicture() {
        onTab(.add)
    }
    
    func removePicture() {
        onTab(.remove)
    }
    
    var isThereAPictureAdded: Bool {
        (picture != nil)
    }
    
    enum Tabbed {
        case add
        case remove
        case show
    }
}
