//
//  ProfilInfoViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUIFlux


protocol ProfilInfoProtocol {
    var isPlaying: Bool { get }
    var name: String { get }
    var age: String { get }
    var cityName: String { get }
    var distance: String { get }
    func playButtonTouched()
    
}

struct ProfilInfoViewModel:ProfilInfoProtocol {
    private let profil: Profile
    private let isPlayingA: Action
    private let notPlayingA: Action
    private let dispatch: DispatchFunction
    
    let isPlaying: Bool
    
    func playButtonTouched() {
        isPlaying ? dispatch(isPlayingA) : dispatch(notPlayingA)
    }
    
    var name: String {
        profil.name
    }
    
    var age: String {
        return "25"
    }
    
    var cityName: String {
        return "München"
    }
    
    var distance: String {
        return "12km"
    }
}

extension ProfilInfoViewModel{
    init(appstate: AppState,dispatch: @escaping DispatchFunction, profilID: String) {
        self.profil = appstate.swipingState.profiles[profilID]?.profile ?? Profile.preDataAccount
        self.isPlaying = appstate.swipingState.isPlaying
        self.isPlayingA = AccountActions.CreateProfil()
        self.notPlayingA = AccountActions.CreateProfil()
        self.dispatch = dispatch
    }
}

extension ProfilInfoViewModel {
    init(appstate: AppState,dispatch: @escaping DispatchFunction) {
        self.profil = appstate.swipingState.firstProfil?.profile ?? Profile.preDataAccount
        self.isPlaying = appstate.swipingState.isPlaying
        self.isPlayingA = AccountActions.CreateProfil()
        self.notPlayingA = AccountActions.CreateProfil()
        self.dispatch = dispatch
    }
}

struct ProfilInfoViewModel2: ProfilInfoProtocol {
    var isPlaying: Bool
    private let profile: Profile
    private let dispatch: DispatchFunction
    
    init(state: AppState, dispatch: @escaping DispatchFunction) {
        self.isPlaying = state.swipingState.isPlaying
        self.dispatch = dispatch
        self.profile = state.accountState.profile ?? Profile.preDataAccount
    }
    
    func playButtonTouched() {
    }
    
    var name: String {
        return profile.name
    }
    
    var age: String {
        return ("12")
    }
    
    var cityName: String {
        return "München"
    }
    
    var distance: String {
        return "24km"
    }
}


class AccountInfoViewModel: ProfilInfoProtocol {
    
    
    var isPlaying = false
    
    var name: String {
        return ""
    }
    
    var age: String {
        return ""
    }
    
    var cityName: String {
        return ""
    }
    
    var distance: String {
       return ""
    }
    
    func playButtonTouched() {
        /// different actions as in ProfilInfoViewModel
    }
}
