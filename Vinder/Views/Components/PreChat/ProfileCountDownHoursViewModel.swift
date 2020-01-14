//
//  ProfileCountDownHoursViewModel.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileCountDownHoursViewModel {
    private var unit:LocalizedStringKey = "Hours"
    
    
    
    var percentageFull: Double {
        return 50
    }
    
    var hours: String {
        
        return "24 \(unit)"
    }
    
    var pictureUrl: URL {
        let string = "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/pictures%2Funnamed.jpg?alt=media&token=4742954b-3820-453c-be73-ba01f1b9fe5e"
        
        return URL(string: string)!
    }
    
}
