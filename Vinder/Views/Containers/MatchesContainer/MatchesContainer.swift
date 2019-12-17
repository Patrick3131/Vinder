//
//  MatchesContainer.swift
//  Vinder
//
//  Created by Patrick Fischer on 16.12.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct MatchesContainer: ConnectedView {
    
    struct Props {
        let profiles: [MatchProfile]
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(profiles: state.accountState.matches)
    }
    
    func body(props: MatchesContainer.Props) -> some View {
        GeometryReader { geometry in
                    List {
                        
                        MatchesRowView()
                        MatchesRowView()
                        MatchesRowView()
                        MatchesRowView()
            }
                }
    }
    
 
}


struct MatchesContainer_Previews: PreviewProvider {
    static var previews: some View {
        MatchesContainer()
    }
}
