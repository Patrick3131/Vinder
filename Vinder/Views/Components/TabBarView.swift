//
//  TabBarView.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab = Tab.swiping
    enum Tab: Int {
        case swiping, matches, profil
    }
    var body: some View {
        TabView(selection: $selectedTab) {
            SwipingView().tabItem {
                TabBarItem(text: "Text", image: "pause.circle")
            }.tag(Tab.swiping)
            
        }
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
        TabBarView()
    }
}
