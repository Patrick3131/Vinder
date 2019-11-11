//
//  ProfilContainer.swift
//  Vinder
//
//  Created by Patrick Fischer on 11.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIFlux


struct ProfilContainer: ConnectedView {
    struct Props {
        
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props()
    }
    
    func body(props: Props) -> some View {
        AddPictureContainer(tabbed: { element in
            
        })
    }
}
