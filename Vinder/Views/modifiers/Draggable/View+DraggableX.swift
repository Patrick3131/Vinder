//
//  View+DraggableX.swift
//  Vinder
//
//  Created by Patrick Fischer on 31.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

extension View {
    func draggableX(_ startingPoint: CGPoint) -> some View {
        return modifier(DraggableX(offset: startingPoint))
    }
}
