//
//  SwipingViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 22.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Combine
import SwiftUIFlux


struct ExplorerViewModel {
    let profilesToSwipe: [String]
    let dispatch: DispatchFunction
    
    var areThereAnyProfilesToSwipe: Bool {
        return !profilesToSwipe.isEmpty
    }
    
    func swipeLeft() {
        
    }
    
    func swipeRight() {
        
    }
    
    func popCurrentProfil() {
        if let first = profilesToSwipe.first {
            dispatch(SwipingActions.PopFirstProfile(id: first))
        }
    }
    
    func loadNewMatches() {
        
    }
}
