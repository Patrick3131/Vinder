//
//  ProfilInfo.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct ProfilInfoView: View {
    @State var isPlaying = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Jessy, 21")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.leading)
                .padding(.trailing)
            Text("München, 24km")
                .padding(.leading)
                .padding(.trailing)
            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: (isPlaying ? "pause.circle" : "play.circle"))
                    .padding(.leading)
            }
        }
    }
}

struct ProfilInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfilInfoView()
    }
}
