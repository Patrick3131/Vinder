//
//  AddSinglePicture.swift
//  Vinder
//
//  Created by Patrick Fischer on 02.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct SinglePictureViewModel {
    var picture: URL?
    var onTab: () -> Void
    func addPicture() {
        onTab()
    }
}

struct SinglePicture: View {
    var viewModel: SinglePictureViewModel
    var color: Color = .blue
    var body: some View {
        Button(action: {
            self.viewModel.addPicture()
        }) {
            Group {
                if viewModel.picture != nil {
                    CacheImage(viewModel.picture!)
                } else {
                    Image(systemName: "plus.circle")
                }
            }
        }.frame(width: 100, height: 100, alignment: .center)
        .clipShape(Circle())
            .overlay(Circle().stroke(color.opacity(0.5),lineWidth: 5))
    }
}


struct AddSinglePicture_Previews: PreviewProvider {
    static var previews: some View {
        SinglePicture(viewModel: (SinglePictureViewModel(picture: nil, onTab: {
            
        })))
    }
}






