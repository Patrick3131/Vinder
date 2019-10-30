//
//  CardView.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct CardView: ConnectedView {
    struct Props {
        let viewModel: ProfilInfoProtocol
    }
    var profilID: Int
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> CardView.Props {
        return Props(viewModel: ProfilInfoViewModel(appstate: state, dispatch: dispatch, profilID: profilID))
    }
    
    func body(props: CardView.Props) -> some View {
        ZStack(alignment: .bottomLeading) {
            Gallery()
            ProfilInfoView3(viewModel: .constant(props.viewModel))
        }.cornerRadius(15)
    }
}

struct Gallery: View {
    var body: some View {
        Image("blondGirl1")
        .resizable()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(profilID: 0).environmentObject(store)
    }
}
