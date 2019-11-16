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
        var genderSelection: Int
        var preferenceSelection: Int
        var dispatch: DispatchFunction
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(genderSelection: 0, preferenceSelection: 0, dispatch: dispatch)
    }
    
    func body(props: Props) -> some View {
        return VStack {
            AddPictureContainer()
            Text("What is your gender?")
            PickerWrapper(selection: 0, label:"" , content: ["Male", "Female"], index: { index in
            print(index)
            
            }).pickerStyle(SegmentedPickerStyle())
            Text("What are you looking for?")
            PickerWrapper(selection: 0, label:"" , content: ["Male", "Female", "Both", "Friendship"], index: { index in
            print(index)
            
            }).pickerStyle(SegmentedPickerStyle())
        }
        
    }
}





struct ProfilContainer_Previews: PreviewProvider {
    static var previews: some View {
        ProfilContainer().environmentObject(store)
        
    }
}

