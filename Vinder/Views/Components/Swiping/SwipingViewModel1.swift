//
//  SwipingViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 22.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Combine


class SwipingViewModel1: ObservableObject {
    private var profilesToSwipe: [MatchProfile]
    @Published var areThereAnyProfilesToSwipe = false
    typealias myType = Swiping
    private var model: myType

    init(profilesToSwipe: [MatchProfile]) {
        self.profilesToSwipe = profilesToSwipe
        self.model = TestSwiping()
    }
    
    private func checkIfThereAreAnyProfiles() {
        areThereAnyProfilesToSwipe = !profilesToSwipe.isEmpty
    }
    
    func swipeLeft(_ completion: @escaping (Bool) -> Void) {
        model.doNotLike { (successful, error) in
            
        }
    }
    
    func swipeRight(_ completion: @escaping (Bool) -> Void) {
        model.like { (successful, error) in
            
        }
    }
}

struct TestSwiping: Swiping {
    func like(_ completion: @escaping (Bool, Error) -> Void) {
        
    }
    
    func doNotLike(_ completion: @escaping (Bool, Error) -> Void) {
        
    }
}
