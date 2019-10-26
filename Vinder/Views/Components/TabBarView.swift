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
        let isLoggedIn: Bool
        let dispatch: DispatchFunction
        let profile: Profile?
        let userUID: String?
    }
    
    @State private var selectedTab = Tab.swiping
    
    
    enum Tab: Int {
        case swiping, matches, profil
    }
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        let props = Props(
            isLoggedIn: state.accountState.loggedIn,
            dispatch: dispatch,
            profile: state.accountState.profile,
            userUID: state.accountState.userUID
        )
        return props
    }
    
    func authenticate() {
        store.dispatch(action: AuthentificationActions.Listen())
    }
    
    func body(props:Props) -> some View {
        Group {
            if props.isLoggedIn && (props.profile != nil) {
                TabView(selection: $selectedTab) {
                    Text(props.profile!.name).tabItem {
                        TabBarItem(text: "Text", image: "pause.circle")
                    }.tag(Tab.swiping)
                }
            } else {
                LoginView()
            }
        }.onAppear { self.authenticate() }
    }
}

struct TabBarItem: View {
    var text: String
    var image: String
    var body: some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(store)
    }
}
