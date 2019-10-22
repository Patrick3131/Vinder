//
//  View+Draggable.swift
//  Vinder
//
//  Created by Patrick Fischer on 22.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI


extension View {
    /// Enables dragging for View, add as a modifier
    func draggable() -> some View {
        return modifier(DraggableView())
    }
}
