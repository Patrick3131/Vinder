//
//  ViewBuilder.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

enum ViewBuilder {
    static func profilInfoBuilder(profile: Profile) -> some View {
        let viewModel = ProfilInfoViewModel(profile: profile)
        return ProfilInfoView(viewModel: viewModel)
    }
}
