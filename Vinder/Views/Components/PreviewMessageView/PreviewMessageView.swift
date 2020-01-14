//
//  PreviewMessageView.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI


struct PreviewMessageView: View {
    var viewModel: PreviewMessageViewModel
    var body: some View {
        GeometryReader { geometry in
            HStack {
                CircleProfileView(pictureUrl: self.viewModel.pictureUrl).frame(width: geometry.size.width * 0.2, height: geometry.size.height, alignment: .center)
                PreviewMessageContentView()
            }
        }
        
    }
}


struct PreviewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            PreviewMessageView(viewModel: PreviewMessageViewModel()).frame(width: geometry.size.width, height: 50, alignment: .center)
        }
        
    }
}
