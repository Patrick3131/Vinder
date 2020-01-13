//
//  CircleProfileView.swift
//  Vinder
//
//  Created by Patrick Fischer on 13.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct CircleProfileView: View {
    var pictureUrl: URL
    var body: some View {
            CacheImage(pictureUrl)
            .resizable()
            .clipShape(Circle())
    }
}

struct CircleProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let string = "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/pictures%2Funnamed.jpg?alt=media&token=4742954b-3820-453c-be73-ba01f1b9fe5e"
        let url = URL(string: string)
        return CircleProfileView(pictureUrl: url!)
            .frame(width: 300, height: 300, alignment: .center).padding()
    }
}
