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
    }
    
    
    
    var tabbed: (Int) -> Void
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        let props = Props(urls: state.accountState.profile?.pictureUrl ?? [URL](), dispatch: dispatch)
        return props
    }
    
    
    func addSinglePicture(props: Props, element: Int) -> SinglePicture {
        SinglePicture(viewModel: SinglePictureViewModel(picture: props.urls.safeAccess(element), onTab: { action in
            switch action {
            case .add:
                break
            case .remove:
                props.dispatch(ProfileUpdateActions.RemoveImage(imageIndex: element, url: props.urls[element]))
            case .show:
                break
            }
            print(action, element)
        }))
    }
    
    func body(props: Props) -> some View {
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
    }
}

struct AddPictureContainer_Previews: PreviewProvider {
    static var previews: some View {
        AddPictureContainer(tabbed: { _ in 
            
        }).environmentObject(store)
        
    }
}
