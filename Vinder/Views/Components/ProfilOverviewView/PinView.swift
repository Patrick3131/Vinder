//
//  PinView.swift
//  Vinder
//
//  Created by Patrick Fischer on 24.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

import UIKit
struct PinView: View {
    
    func createPinImage() -> UIImage {
    
        return (UIImage(named: "location-pin")?.withTintColor(.blue, renderingMode: .alwaysTemplate))!
    }
    
    var body: some View {
       ZStack {
            Circle()
                .fill(Color.lightBackground)
            Image(uiImage: createPinImage())
        .resizable()

        }
    }
}

struct PinView_Previews: PreviewProvider {
    static var previews: some View {
        PinView().frame(width: 50, height: 50, alignment: .center)
    }
}
