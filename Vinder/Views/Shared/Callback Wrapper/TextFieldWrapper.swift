//
//  TextFieldWrapper.swift
//  Vinder
//
//  Created by Patrick Fischer on 21.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct TextFieldWrapper: View {

    @State var text: String = ""
    var placeholder: String = ""
    var currentText: (String) -> Void
    
    var body: some View {
        let binding = Binding<String> (
            get: {
                return self.text
        }, set: {
            self.text = $0
            self.currentText($0)
        })
        return TextField(placeholder, text: binding)
    }
}


