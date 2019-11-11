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
    }
    
    var tabbed: (Int) -> Void
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        let props = Props(urls: state.accountState.profile?.pictureUrl ?? [URL]())
        return props
    }
    
    func body(props: Props) -> some View {
        VStack {
            HStack {
                SinglePicture(viewModel: SinglePictureViewModel(picture: props.urls.safeAccess(0), onTab: {
                    self.tabbed(0)
                }))
                SinglePicture(viewModel: SinglePictureViewModel(picture: props.urls.safeAccess(1), onTab: {
                    self.tabbed(1)
                }))
                SinglePicture(viewModel: SinglePictureViewModel(picture: props.urls.safeAccess(2), onTab: {
                    self.tabbed(2)
                }))
            }
            HStack {
                SinglePicture(viewModel: SinglePictureViewModel(picture: props.urls.safeAccess(3), onTab: {
                    self.tabbed(3)
                }))
                SinglePicture(viewModel: SinglePictureViewModel(picture: props.urls.safeAccess(4), onTab: {
                    self.tabbed(4)
                }))
                SinglePicture(viewModel: SinglePictureViewModel(picture: props.urls.safeAccess(5), onTab: {
                    self.tabbed(5)
                }))
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
