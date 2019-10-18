//
//  TabBarView.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var sessionStore: SessionStore
    @State private var selectedTab = Tab.swiping
    
    enum Tab: Int {
        case swiping, matches, profil
    }
    
    var body: some View {
        Group {
            if (sessionStore.session != nil) {
                         TabView(selection: $selectedTab) {
                            SwipingView().tabItem {
                                TabBarItem(text: "Text", image: "pause.circle")
                            }.tag(Tab.swiping)
                        }
                    } else {
                        LoginView()
                    }
        }.onAppear(perform: sessionStore.listen).onDisappear(perform: sessionStore.stopListen)
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
        TabBarView().environmentObject(SessionStore())
    }
}
