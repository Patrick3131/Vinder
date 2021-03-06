//
//  PickerWrapper.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUI

struct PickerWrapper: View {
    
    @State var selection: Int
    let label: String
    let content: [String]
    var index: (Int) -> Void
    
    var body: some View {
        let binding = Binding<Int> (
            get: {
                return self.selection
        }, set: {
            self.selection = $0
            self.index($0)
        }
        )
        return Picker(selection: binding, label: Text(label), content: {
            ForEach(0 ..< content.count) {
                Text(self.content[$0]).tag($0)
            }
        })
    }
}




