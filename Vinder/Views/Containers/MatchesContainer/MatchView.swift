//
//  MatchView.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct MatchViewModel {
    var profile: Profile
    
    var city: String {
        return "Munich"
    }
    
    var age: String {
        return "25"
    }
    
    var name: String {
        return profile.name ?? ""
    }
    
    var pictureUrl: URL {
        return URL(string: "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/media%2FRPTujanhFfc3zVLaKoPXvqXb8WH37?alt=media&token=9afc87af-d8be-4bce-8219-c808f44a5f9b")!
    }
    
}

struct MatchView: View {
    let url: URL?
    var isPlaying: Bool = false
    var toggled: (Bool) -> Void
    var body: some View {
        
            GeometryReader { geometry in
                VStack(alignment: .center) {
                CacheImage(self.url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 200, alignment: .center)
                    .background(Color.blue)
                Text("name")
                HStack {
                    Text("24, München")
                    Button(action: {
                        self.toggled(self.isPlaying)
                    } , label: {
                        Image(systemName:  (self.isPlaying ? "pause.circle" : "play.circle"))
                    })
                }
            }
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/media%2FRPTujanhFfc3zVLaKoPXvqXb8WH37?alt=media&token=9afc87af-d8be-4bce-8219-c808f44a5f9b")
        return MatchView(url: url, toggled: { toggled in
            print(toggled)
            
        })
    }
}
