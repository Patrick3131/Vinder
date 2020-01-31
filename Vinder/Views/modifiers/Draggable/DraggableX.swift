//
//  DraggableXView.swift
//  Vinder
//
//  Created by Patrick Fischer on 31.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct DraggableX: ViewModifier {
    @State var offset = CGPoint(x:0,y:0)
    
    func body(content:Content) -> some View {
        content.gesture(DragGesture(minimumDistance: 0)
            .onChanged { value in
                self.offset.x += value.location.x - value.startLocation.x
                
            }
        ).offset(x: self.offset.x, y: self.offset.y)
    }
}
