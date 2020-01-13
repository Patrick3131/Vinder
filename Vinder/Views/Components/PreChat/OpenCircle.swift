//
//  OpenCircle.swift
//  Vinder
//
//  Created by Patrick Fischer on 13.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct OpenCircle: View {
    
    var percentageFull: Double
    var strokeColor = Color.black
    var lineWidth: CGFloat = 10
    
    private func createAngle(percentage: Double) -> Angle {
        if percentageFull == 100 {
            return Angle(degrees: 360)
        }
        
        if percentageFull == 0 {
            return Angle(degrees: 0)
        }
        
        let openPercentage = 100 - percentageFull
        let degree = openPercentage * 3.6
        return Angle(degrees: degree)
    }
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.addArc(center: CGPoint(x: ((geometry.size.width) / 2) , y: (geometry.size.width) / 2), radius: (geometry.size.width - self.lineWidth) / 2, startAngle: Angle(degrees: 0), endAngle: self.createAngle(percentage: self.percentageFull), clockwise: true)
            }
        .rotation(Angle(degrees: -90))
            .stroke(self.strokeColor,lineWidth: self.lineWidth)
            
        }
    }
}

struct OpenCircle_Previews: PreviewProvider {
    static var previews: some View {
        OpenCircle(percentageFull: 4).background(Color.blue).frame(width: 200, height: 200, alignment: .leading)
    }
}
