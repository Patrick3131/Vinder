//
//  Draggable.swift
//  Vinder
//
//  Created by Patrick Fischer on 22.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct DraggableView: ViewModifier {
    @State var offset = CGPoint(x: 0, y: 0)
    func body(content: Content) -> some View {
        content
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged { value in
                self.offset.x += value.location.x - value.startLocation.x
                self.offset.y += value.location.y - value.startLocation.y
        })
            .offset(x: self.offset.x, y: self.offset.y)
    }
}
