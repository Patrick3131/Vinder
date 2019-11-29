//
//  BioView.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

//View mit Audio Icon (waveform) und einem Delete(trash), Record(mic) & Play (play.circle) Button
/// View a biography has not been recorded yet
struct BioView: View {
    var record: () -> Void
    var body: some View {
        Button(action: {
            self.record()
        }, label: {
            Image(systemName: "mic")
        }).padding(.bottom, 8)
    }
}

struct BioView_Previews: PreviewProvider {
    static var previews: some View {
        BioView(record: {
            
        })
    }
}
