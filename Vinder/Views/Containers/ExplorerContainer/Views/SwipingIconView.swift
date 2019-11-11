//
//  SwipingIconView.swift
//  Vinder
//
//  Created by Patrick Fischer on 24.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct SwipingIconView: View {
    
    let dislike: () -> Void
    let like: () -> Void
    
    var body: some View {
        HStack(spacing: 50) {
            Button(action: {
                self.dislike()
            }) {
                Image(systemName: "xmark.circle")
                .resizable()
                .foregroundColor(.red)
            }.frame(width: 50, height: 50, alignment: .leading)
            
            Button(action: {
                self.like()
            }) {
                Image(systemName: "checkmark.circle")
                .resizable()
                    .foregroundColor(.green)
            }.frame(width: 50, height: 50, alignment: .trailing)
        }
    }
}

struct SwipingIconView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingIconView(dislike: {
            
        }, like: {
            print()
        })
    }
}
