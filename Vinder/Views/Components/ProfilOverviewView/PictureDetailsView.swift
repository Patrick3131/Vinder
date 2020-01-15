//
//  PictureDetailsView.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI



struct PictureDetailsView: View {
    var viewModel: PictureDetailsViewModel
    var textColor: Color = .white
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            CacheImage(viewModel.pictureUrl)
                .resizable()
                .aspectRatio(1.0,contentMode: .fill)
            VStack(alignment: .leading) {
                Text(viewModel.detailsName + ", " + viewModel.detailsAge)
                    .font(.title)
                    .foregroundColor(textColor)
                .bold()
                    .padding(.bottom)
                Text(viewModel.detailsUniversity)
                    .foregroundColor(textColor)
            }.padding()
        }
    }
}

struct PictureDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            PictureDetailsView(viewModel: PictureDetailsViewModel()).frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
        }
    }
}
