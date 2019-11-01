//
//  SwipingActions.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct SwipingActions {
    struct LikeProfile: Action {
        let id: Int
    }
    
    struct DislikeProfile: Action {
        let id: Int
    }
    
    struct PopFirstProfile: Action {
        let id: String
    }
    
    struct fetchProfiles: AsyncAction {
        
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            
        }
    }
    
    struct SetProfiles: Action {
        
    }
}
