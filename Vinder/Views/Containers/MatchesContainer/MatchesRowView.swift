//
//  MatchesRow.swift
//  Vinder
//
//  Created by Patrick Fischer on 16.12.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct MatchesRowView: View {
    var body: some View {
            HStack {
                MatchView(viewModel: MatchViewModel(profile: Profile.preDataAccount), isPlaying: false, toggled: { toogle in
                    
                })
                MatchView(viewModel: MatchViewModel(profile: Profile.preDataAccount), isPlaying: false, toggled: { toogle in
                    
                })
            }.frame(height: 300, alignment: .center)

        
    }
}

struct MatchesRow_Previews: PreviewProvider {
    static var previews: some View {
        MatchesRowView()
    }
}
