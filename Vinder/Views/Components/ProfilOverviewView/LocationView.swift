//
//  LocationView.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    
    var locationName: String
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                PinView()
                
                    .frame(width: 25, height: 25, alignment: .center)
                    
                Text("Location")
            }
            Spacer()
            Text(locationName).bold()
        }
        
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            LocationView(locationName: "Buenos Aires, Argentina")
            .padding()
                .frame(width: geometry.size.width, height: 100, alignment: .leading)
        }
        
    }
}
