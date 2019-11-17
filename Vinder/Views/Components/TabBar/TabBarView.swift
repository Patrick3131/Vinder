//
//  TabBarView.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct TabBarView: ConnectedView {
    
    struct Props {
        let viewModel: TabBarViewModel
    }
    
    @State private var selectedTab = Tab.profil
    
    private enum Tab: Int {
        case swiping, matches, profil, chat
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        let props = Props(
            viewModel: TabBarViewModel(state: state, dispatch: dispatch)
        )
        return props
    }
    
    func authenticate(props: Props) {
        props.viewModel.authenticate()
    }
    
    func body(props:Props) -> some View {
        Group {
            if props.viewModel.showTabView {
                TabView(selection: $selectedTab) {
                    Button(action: {
                        props.viewModel.logout()
                    }, label: {
                        Text("props.viewModel.profile!.name").foregroundColor(.green)
                        }).tabItem({
                            TabBarItem(text: "Chat", image: "pause.circle")
                        }).tag(Tab.chat)
                    Text(props.viewModel.profile!.name!).tabItem {
                        TabBarItem(text: "Matches", image: "pause.circle")
                    }.tag(Tab.matches)
                    ExplorerContainer().tabItem {
                        TabBarItem(text: "Explore", image: "pause.circle")
                    }.tag(Tab.swiping)
                    ProfilContainer().tabItem {
                        TabBarItem(text: "Profile", image: "pause.circle")
                    }.tag(Tab.profil)
                }
            } else if props.viewModel.showProfilNotCompleteView {
                Button(action: {
                    let profile = Profile(id: "RPTujanhFfc3zVLaKoPXvqXb8WH3", name: "name", age: Date.init(), gender: .male, preference: .bi, pictureUrl: [URL](), biography: nil, location: nil)
                    store.dispatch(action: AccountActions.CreateProfil(profile: profile))
//                    store.dispatch(action: )
                }, label: {
                    ProfilContainer()
                })
            } else {
                LoginView()
            }
        }.onAppear { self.authenticate(props: props) }
    }
}



struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(store)
    }
}
