//
//  MatchView.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct MatchView: View {
    let url: URL?
    var body: some View {
        VStack {
            CacheImage(url)
            Text("name")
            HStack {
                Text("24, München")
                Button(action: {
                    
                }, label: {
                    Text("Ply")
                })
            }
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(url: nil)
    }
}
