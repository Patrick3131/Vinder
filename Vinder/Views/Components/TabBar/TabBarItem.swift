//
//  TabBarItem.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

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

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(text: "Item", image: "pause.circle")
    }
}
