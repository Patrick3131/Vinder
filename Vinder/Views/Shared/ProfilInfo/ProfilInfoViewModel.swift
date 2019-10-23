//
//  ProfilInfoViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Combine


class ProfilInfoViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
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
