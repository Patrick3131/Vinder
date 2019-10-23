//
//  CardView.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Gallery().padding(.top)
            ViewBuilder.profilInfoBuilder(profile: Profile.preDataAccount)
                .padding(.bottom)
        }
    }
}

struct Gallery: View {
    var body: some View {
        Image("blondGirl1")
        .resizable()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
