//
//  SwipingIconView.swift
//  Vinder
//
//  Created by Patrick Fischer on 24.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct SwipingIconView: View {
    
    var body: some View {
        HStack(spacing: 50) {
            Button(action: {}) {
                Image(systemName: "xmark.circle")
                .resizable()
                .foregroundColor(.red)
            }.frame(width: 50, height: 50, alignment: .leading)
            
            Button(action: {}) {
                Image(systemName: "checkmark.circle")
                .resizable()
                    .foregroundColor(.green)
            }.frame(width: 50, height: 50, alignment: .trailing)
        }
    }
}

struct SwipingIconView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingIconView()
    }
}
