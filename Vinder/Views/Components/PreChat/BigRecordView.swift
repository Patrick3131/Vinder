//
//  BigRecordView.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct BigRecordView: View {
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { geometry in
                Capsule().fill(Color.lightBackground)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                Image(systemName: "mic")
                    .resizable()
                    .padding(geometry.size.width * 0.3)
                }
            }
            
    }
}

struct BigRecordView_Previews: PreviewProvider {
    static var previews: some View {
        BigRecordView().frame(width: 200, height: 250, alignment: .leading)
    }
}
