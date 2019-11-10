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
        case swiping, matches, profil
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
                            TabBarItem(text: "text", image: "pause.circle")
                        }).tag(Tab.profil)
                    Text(props.viewModel.profile!.name).tabItem {
                        TabBarItem(text: "Text", image: "pause.circle")
                    }.tag(Tab.matches)
                    SwipingView().tabItem {
                        TabBarItem(text: "Swipe", image: "pause.circle")
                    }.tag(Tab.swiping)
                }
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
