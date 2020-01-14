//
//  PreChatView.swift
//  Vinder
//
//  Created by Patrick Fischer on 10.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUI


struct PreChatView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ProfileCountDownHoursView(viewModel: ProfileCountDownHoursViewModel())
                    PreChatTextView(remainingTime: 15)
                }.padding(.top, geometry.size.height * 0.1)
                    .padding(.horizontal, 20)
                Spacer()
                BigRecordView().frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.4, alignment: .center).padding(.bottom, geometry.size.height * 0.1)
            }
        }
        
        
    }
}




struct PreChatView_Previews: PreviewProvider {
    static var previews: some View {
        PreChatView()
    }
}
