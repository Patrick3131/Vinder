//
//  ProfilInfo.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct ProfilInfoView: View {
    @ObservedObject var viewModel: ProfilInfoViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name + ", " + viewModel.age)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.leading)
                .padding(.trailing)
            Text(viewModel.cityName + ", " + viewModel.distance)
                .padding(.leading)
                .padding(.trailing)
            Button(action: {
                self.viewModel.isPlaying.toggle()
            }) {
                Image(systemName: (viewModel.isPlaying ? "pause.circle" : "play.circle"))
                    .padding(.leading)
            }
        }
    }
}

struct ProfilInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfilInfoView(viewModel: ProfilInfoViewModel(profile: Profile.preDataAccount))
    }
}
