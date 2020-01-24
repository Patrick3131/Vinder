//
//  LocationView.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        HStack {
            PinView()
            
                .frame(width: 25, height: 25, alignment: .center)
                
            Text("Location")
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().frame(width: 100, height: 50, alignment: .center)
    }
}
