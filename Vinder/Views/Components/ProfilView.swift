//
//  ProfilView.swift
//  Vinder
//
//  Created by Patrick Fischer on 12.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct ProfilView: View {
    
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Image("blondGirl1")
                .resizable()
                .scaledToFit()
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

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
