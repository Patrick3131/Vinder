//
//  AddSinglePicture.swift
//  Vinder
//
//  Created by Patrick Fischer on 02.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct SinglePictureViewModel {
    var picture: String?
    
    func addPicture() {
        
    }
}

struct SinglePicture: View {
    @Binding var viewModel: SinglePictureViewModel
    var body: some View {
        Button(action: {
            self.viewModel.addPicture()
        }) {
            Image(viewModel.picture ?? "plus.circle")
        }
    }
}

struct AddSinglePicture_Previews: PreviewProvider {
    static var previews: some View {
        SinglePicture(viewModel: .constant(SinglePictureViewModel(picture: nil)))
    }
}

import SwiftUIFlux

struct AddPictures: ConnectedView {
    
    struct Props {
        
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props()
    }
    
    func body(props: Props) -> some View {
        Text("")
    }
}
