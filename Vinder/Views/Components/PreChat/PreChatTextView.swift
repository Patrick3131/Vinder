//
//  PreChatTextView.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct PreChatTextView: View {
    var remainingTime: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kontaktiere dein Match!").font(.title)
            Text("Ihr habt nur noch \(remainingTime) Stunden, um einen Chat zu starten, bevor euer Match verfällt").foregroundColor(Color.gray)
        }
    }
}

struct PreChatTextView_Previews: PreviewProvider {
    static var previews: some View {
        PreChatTextView(remainingTime: 15)
    }
}
