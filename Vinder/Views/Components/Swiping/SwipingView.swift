//
//  SwipingView.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct SwipingView: View {
    @EnvironmentObject var viewModel: SwipingViewModel
    var body: some View {
        Group {
            if viewModel.areThereAnyProfilesToSwipe {
                VStack {
                     Text("Text")
                    CardView()
                }
            } else {
                Text("No profiles to swipe, consider changing your settings")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
        }
        
       
    }
}

struct SwipingView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingView().environmentObject(SwipingViewModel(profilesToSwipe: [MatchProfile.preDataAccount]))
    }
}
