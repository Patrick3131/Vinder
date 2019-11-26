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
        var name: String
        var isRecordingDetailViewActive: Bool
        var dispatch: DispatchFunction
        var isBioRecordingAvailable: Bool
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(
            genderSelection: 0,
            preferenceSelection: 0,
            birthday: Date(),
            name: "Patrick",
            isRecordingDetailViewActive: state.profileUpdateState.showRecordingDetailView,
            dispatch: dispatch,
            isBioRecordingAvailable: (state.accountState.profile?.biography != nil) ? true : false)
    }
    @State var test = Date()
    @State var stringTest = "Test"
    
    private func upperPart() -> some View {
        VStack {
            Spacer()
            Text("Curate your profile").font(.title)
            Spacer()
            Text("Choose awesome pictures for your profile")
            AddPictureContainer()
        }
        
    }
    
    func body(props: Props) -> some View {
        return VStack(alignment: .center) {

            ZStack {
                Form {
                    Section {
                        upperPart().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    }
                    
                    Section {
                        TextFieldWrapper(text: props.name, placeholder: "What is your name?", currentText: { text in
                            print(text)
                            }).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Section {
                        AddBiography(viewModel: AddBioViewModel(tabbed: { action in
                            switch action {
                            case .recording:
                                props.dispatch(ProfileUpdateActions.ShowRecordingDetailView(show: true))
                                props.dispatch(ProfileUpdateActions.BioRecording(recording: true, profile: store.state.accountState.profile!))
                            default:
                                break
                            }
                        }, isBioAvailable: props.isBioRecordingAvailable)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    }
                    
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
                
                if props.isRecordingDetailViewActive {
                    
                    GeometryReader { geometry in
                        Button(action: {
                            props.dispatch(ProfileUpdateActions.ShowRecordingDetailView(show: false))
                        }, label: {
                            EmptyView()
                        })
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                            .background(Color.white.opacity(0.8))
                    }
                    
                    VStack(alignment: .center, spacing: 80) {
                        Text("Tell something about yourself").font(.largeTitle).multilineTextAlignment(.center).lineLimit(nil)
                        RecordView(action: { status in
                            switch status {
                            case .stoppedRecording:
                                props.dispatch(ProfileUpdateActions.ShowRecordingDetailView(show: false))
                                props.dispatch(ProfileUpdateActions.BioRecording(recording: false, profile: store.state.accountState.profile!))

                            default:
                                break
                            }
                            
                        }).background(Color.white)
                    }
                    
                    
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

