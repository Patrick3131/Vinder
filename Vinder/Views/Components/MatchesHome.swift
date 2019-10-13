//
//  MatchesHome.swift
//  Vinder
//
//  Created by Patrick Fischer on 12.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct MatchesHome: View {
    var matches = Matches.testData
    var body: some View {
        VStack {
            
            MatchesView()
            List(matches) { names in
                ConversationPreview(imageString: names.pictureName, text: names.name)
            }
        }
        
    }
}

struct MatchesHome_Previews: PreviewProvider {
    static var previews: some View {
        MatchesHome()
    }
}
