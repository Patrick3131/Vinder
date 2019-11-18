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
        var birthday: Date
        var dispatch: DispatchFunction
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(genderSelection: 0, preferenceSelection: 0, birthday: Date(), dispatch: dispatch)
    }
    
    func body(props: Props) -> some View {
        return VStack(alignment: .center) {
            Spacer()
            Text("Curate your profile").font(.title)
            Spacer()
            Text("Choose awesome pictures for your profile")
            
            AddPictureContainer()
            
            Form {
                Section {
                    DatePickerWrapper(selection: props.birthday, date: { date in
                    print(date)
                    }, label: Text("When is your birthday?"))
                }
                Section {
                    Text("What is your gender?").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

                    PickerWrapper(selection: props.genderSelection, label:"What is your Gender?" , content: ["Male", "Female"], index: { index in
                    print(index)
                    
                    }).pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("What are you looking for?").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

                    PickerWrapper(selection: props.preferenceSelection, label: "What are you looking for?" , content: ["Male", "Female", "Both", "Friendship"], index: { index in
                    print(index)
                    
                    }).pickerStyle(SegmentedPickerStyle())
                }
            }
            
            
            
        }
        
    }
}





struct ProfilContainer_Previews: PreviewProvider {
    static var previews: some View {
        ProfilContainer().environmentObject(store)
        
    }
}

