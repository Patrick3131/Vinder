//
//  PreviewMessageContentView.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct PreviewMessageContentView: View {
    var newMessage: Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("Vanessa, 24").bold()
//                              .padding(.bottom)
                HStack {
                    Image(systemName: "play.circle").foregroundColor(Color.gray)
                    Text("5:34 min").foregroundColor(Color.gray)
//                    Text("12.2.2020")
                }
            }
            Spacer()
            Circle().fill(Color.red)
                .frame(width: 10, height: 10, alignment: .center)
            .padding()
                .padding(.trailing, 20)
        }
    }
}
struct PreviewMessageContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMessageContentView().frame(width: 300, height: 50, alignment: .center)
    }
}
