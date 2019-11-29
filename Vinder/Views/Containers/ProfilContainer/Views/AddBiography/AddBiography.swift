//
//  AddBiography.swift
//  Vinder
//
//  Created by Patrick Fischer on 18.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI



struct AddBiography: View {
    var viewModel: AddBioViewModel
    var body: some View {
        VStack {
            Text("Tell something about yourself:")
            Group {
                if viewModel.isBioAvailable {
                    RecordBioAudio(record: {
                        self.viewModel.record()
                    }, delete: {
                        self.viewModel.delete()
                    }, play: {
                        self.viewModel.play()
                    })
                } else {
                    BioView(record: {
                        self.viewModel.record()
                    })
                }
            }
        }
        
    }
}







struct AddBiography_Previews: PreviewProvider {
    static var previews: some View {
        AddBiography(viewModel: AddBioViewModel(tabbed: { _ in
            
        }, isBioAvailable: true))
    }
}
