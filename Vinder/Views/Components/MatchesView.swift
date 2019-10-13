//
//  MatchesView.swift
//  Vinder
//
//  Created by Patrick Fischer on 12.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct MatchesView: View {
    var pictureNames = Matches.testData
    var body: some View {
        ScrollView(.horizontal,content:  {
            HStack(spacing:10) {
                ForEach(pictureNames) { name in
                    Image(name.pictureName)
                    .resizable()
                    .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                    
                }
            }
        })
    }
}

struct Matches: Identifiable {
    var id: String = UUID().uuidString
    var pictureName: String
    var name: String
    
    static var testData = [Matches(pictureName: "latina1", name: "Jessica"),
                           Matches(pictureName: "latina2", name: "Freya"),
                           Matches(pictureName: "latina3", name: "Marina"),
                           Matches(pictureName: "latina4", name: "Frida"),
                           Matches(pictureName: "latina5", name: "Francesca"),
                           Matches(pictureName: "blondGirl1", name: "Viola")
    ]
    
    
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}
