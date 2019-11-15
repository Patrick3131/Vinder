//
//  AddPictureContainer.swift
//  Vinder
//
//  Created by Patrick Fischer on 11.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIFlux

struct AddPictureContainer: ConnectedView {
    struct Props {
        let urls: [URL]
        let dispatch: DispatchFunction
        var showImagePicker: Bool = false
        var imageProcessingStatus = ImageProcessingStatus.isReady
    }
    
    var tabbed: (Int) -> Void
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        let props = Props(
            urls: state.accountState.profile?.pictureUrl ?? [URL](),
            dispatch: dispatch, showImagePicker: state.profileUpdateState.showImagePicker,
            imageProcessingStatus: state.profileUpdateState.imageUploadStatus)
        return props
    }
    
    func addSinglePicture(props: Props, element: Int) -> SinglePicture {
        var viewModel = SinglePictureViewModel(picture: props.urls.safeAccess(element), onTab: { action in
            switch action {
            case .add:
                props.dispatch(ProfileUpdateActions.ShowImagePicker(show: true))
            case .remove:
                props.dispatch(ProfileUpdateActions.RemoveImage(imageIndex: element, url: props.urls[element]))
            case .show:
                break
            }
            print(action, element)
        })
        
        switch props.imageProcessingStatus {
        case .imageIsProcessing(index: let processingElement):
            if element == processingElement {
                viewModel.isActivitySpinnerActivated = true
            }
        default: break
        }
        return SinglePicture(viewModel: viewModel)
    }
    
    func body(props: Props) -> some View {
        ZStack {
            VStack {
                HStack {
                    addSinglePicture(props: props, element: 0)
                    addSinglePicture(props: props, element: 1)
                    addSinglePicture(props: props, element: 2)
                }
                HStack {
                    addSinglePicture(props: props, element: 3)
                    addSinglePicture(props: props, element: 4)
                    addSinglePicture(props: props, element: 5)

                }
            }
        }.sheet(isPresented: .constant(props.showImagePicker), content: {
            ImagePickerWrapper(selectedImage: { image in
                if let image = image {
                    props.dispatch(ProfileUpdateActions.UploadImage(image: image, profile: store.state.accountState.profile!, element: props.urls.count))
                }
                props.dispatch(ProfileUpdateActions.ShowImagePicker(show: false))
            })
        })
        
    }
}

struct AddPictureContainer_Previews: PreviewProvider {
    static var previews: some View {
        AddPictureContainer(tabbed: { _ in 
            
        }).environmentObject(store)
        
    }
}
