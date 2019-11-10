//
//  TabBarViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux


struct TabBarViewModel {
    let isLoggedIn: Bool
    let dispatch: DispatchFunction
    let profile: Profile?
    let userUID: String?
    
    init(state: AppState, dispatch: @escaping DispatchFunction) {
        self.isLoggedIn = state.accountState.loggedIn
        self.dispatch = dispatch
        self.profile = state.accountState.profile
        self.userUID = state.accountState.userUID
    }
    
    func authenticate() {
        
        dispatch(AccountActions.Authenticate())
    }
    
    var showTabView: Bool {
        return (isLoggedIn && (profile != nil)) ? true : false
    }
    
    
    func logout() {
        dispatch(AccountActions.Logout())
    }
}
