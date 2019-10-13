//
//  ConversationPreview.swift
//  Vinder
//
//  Created by Patrick Fischer on 12.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct ConversationPreview: View {
    var imageString: String
    var text: String
    var body: some View {
        HStack {
            Image(imageString)
            .resizable()
            .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
            Text(text)
                .font(.body)
            .bold()
        
        }
    }
}

struct ConversationPreview_Previews: PreviewProvider {
    static var previews: some View {
        ConversationPreview(imageString: "latina1", text: "Francesca")
    }
}
