//
//  ProfileCountDownHoursView.swift
//  Vinder
//
//  Created by Patrick Fischer on 13.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI




struct ProfileCountDownHoursView: View {
    var viewModel: ProfileCountDownHoursViewModel
    var lineWidth:CGFloat = 10

    var body: some View {
        VStack {
            ProfileCountdownView(percentageFull: viewModel.percentageFull, lineWidth: lineWidth, pictureUrl: viewModel.pictureUrl)
                .frame(width: 200, height: 200, alignment: .center)
            Text(viewModel.hours)
                .frame(width: 60, height: 20, alignment: .center)
                .padding(.horizontal)
                .background(Color.lightBackground)
            .cornerRadius(25)
            
        }
    }
}

struct ProfileCountDownHoursView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "de"], id: \.self) { id in
            ProfileCountDownHoursView(viewModel: ProfileCountDownHoursViewModel()).frame(width: 200, height: 200, alignment: .center)
                .environment(\.locale, .init(identifier: id))
        }
    }
}
