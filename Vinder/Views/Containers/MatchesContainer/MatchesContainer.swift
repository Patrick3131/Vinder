//
//  MatchesContainer.swift
//  Vinder
//
//  Created by Patrick Fischer on 16.12.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux
import ASCollectionView

struct MatchesContainer: ConnectedView {
    
    @State var dataExample = (0 ..< 30).map { $0 }
    
    struct Props {
        let profiles: [MatchProfile]
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(
            profiles:
//            [MatchProfile.preDataAccount,second]
            [MatchProfile.preDataAccount, MatchProfile.pre1, MatchProfile.pre2, MatchProfile.pre3]
        )
    }
    
    func body(props: MatchesContainer.Props) -> some View {
        GeometryReader { geometry in
            ASCollectionView(section: ASCollectionViewSection(id: 0, data: props.profiles, contentBuilder: { item, _ in
                MatchView(viewModel: MatchViewModel(profile: item.profile), isPlaying: false, toggled: { _ in
                    
                    })
                })

            )
                .layout {
                    
                    .grid(layoutMode: .adaptive(withMinItemSize:200),
                          itemSpacing: 15,
                          lineSpacing: 5,
                          itemSize: .estimated(300))
            }
            .background(Color.lightBackground)
        }
    }
}

struct MatchesCollectionView: View {
    @State var dataExample = (0 ..< 30).map { $0 }

    var body: some View {
        GeometryReader { geometry in
            ASCollectionView(data: self.dataExample, dataID: \.self, contentBuilder: { item, _ in
                Color.blue.overlay(Text("\(item)"))
                
            }).layout {
                .grid(layoutMode: .adaptive(withMinItemSize: 100),
                itemSpacing: 5,
                lineSpacing: 5,
                itemSize: .absolute(geometry.size.width * 0.8))
            }
        }
        
    }
}

struct MatchesContainer_Previews: PreviewProvider {
    static var previews: some View {
        MatchesContainer().environmentObject(store)
    }
}
