//
//  DatePickerWrapper.swift
//  Vinder
//
//  Created by Patrick Fischer on 21.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct DatePickerWrapper<Content: View>: View {
    @State var selection: Date
    var date: (Date) -> Void
    var label: Content
    
    var body: some View {
        let binding = Binding<Date> (
            get: {
                return self.selection
        }, set: {
            self.selection = $0
            self.date($0)
        }
        )
        return DatePicker(selection: binding, in: ...Date(), displayedComponents: .date, label: {
            label
            })
    }
}
