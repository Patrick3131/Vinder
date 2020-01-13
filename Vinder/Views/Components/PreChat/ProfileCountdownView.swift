//
//  ProfileCountdownView.swift
//  Vinder
//
//  Created by Patrick Fischer on 10.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUI


struct ProfileCountdownView: View {
    
    var percentageFull: Double
    var lineWidth:CGFloat = 10
    var pictureUrl: URL
    var body: some View {
        ZStack {
            CircleProfileView(pictureUrl: pictureUrl)
                .padding(lineWidth)
            OpenCircle(percentageFull: percentageFull, lineWidth: lineWidth)
        }
    }
}

struct ProfileCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        let string = "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/pictures%2Funnamed.jpg?alt=media&token=4742954b-3820-453c-be73-ba01f1b9fe5e"
        let url = URL(string: string)
        return ProfileCountdownView(percentageFull: 30, lineWidth: 10, pictureUrl: url!).frame(width: 200, height: 200, alignment: .center)
    }
}

