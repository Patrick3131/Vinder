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
    var viewModel: MatchViewModel
    var isPlaying: Bool = false
    var toggled: (Bool) -> Void
    var body: some View {
        
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    CacheImage(self.viewModel.pictureUrl)
                    .resizable()
                    .cornerRadius(20)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                    Text(self.viewModel.name)
                HStack {
                    Text((self.viewModel.age + ", " + self.viewModel.city))
                    Button(action: {
                        self.toggled(self.isPlaying)
                    } , label: {
                        Image(systemName:  (self.isPlaying ? "pause.circle" : "play.circle"))
                    })
                }
                }
                .cornerRadius(20)
                .background(Color.white)
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/media%2FRPTujanhFfc3zVLaKoPXvqXb8WH37?alt=media&token=9afc87af-d8be-4bce-8219-c808f44a5f9b")
        return MatchView(viewModel: MatchViewModel(profile: Profile.preDataAccount), toggled: { toggled in
            print(toggled)
            
        })
    }
}
