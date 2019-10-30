//
//  ProfilInfo.swift
//  Vinder
//
//  Created by Patrick Fischer on 23.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct ProfilInfoView: ConnectedView {
    struct Props {
        let viewModel: ProfilInfoProtocol
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(viewModel: ProfilInfoViewModel2(state: state, dispatch: dispatch))
    }
    
    func body(props: Props) -> some View {
        VStack(alignment: .leading) {
            Text(props.viewModel.name + ", " + props.viewModel.age)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing])
            Text(props.viewModel.cityName + ", " + props.viewModel.distance)
                .padding([.leading, .trailing])
            Button(action: {
                props.viewModel.playButtonTouched()
            }) {
                Image(systemName: (props.viewModel.isPlaying ? "pause.circle" : "play.circle"))
                    .padding(.leading)
            }
        }
    }
}

struct ProfilInfoView3: View {
    @Binding var viewModel: ProfilInfoProtocol
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name + ", " + viewModel.age)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing])
            Text(viewModel.cityName + ", " + viewModel.distance)
                .padding([.leading, .trailing])
            Button(action: {
                self.viewModel.playButtonTouched()
            }) {
                Image(systemName: (viewModel.isPlaying ? "play.circle" : "pause.circle"))
                    .padding(.leading)
            }.padding(.bottom)
        }
    }
}


//struct ProfilInfoView3: View {
//    var viewModel: ProfilInfoProtocol
//
//    var body: some View {
//
//    }
//
//}

//struct ProfilInfoView2: View {
//    @ObservedObject var viewModel: ProfilInfoViewModel
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(viewModel.name + ", " + viewModel.age)
//                .font(.title)
//                .multilineTextAlignment(.center)
//                .padding(.leading)
//                .padding(.trailing)
//            Text(viewModel.cityName + ", " + viewModel.distance)
//                .padding(.leading)
//                .padding(.trailing)
//            Button(action: {
//                self.viewModel.isPlaying.toggle()
//            }) {
//                Image(systemName: (viewModel.isPlaying ? "pause.circle" : "play.circle"))
//                    .padding(.leading)
//            }
//        }
//    }
//}

struct ProfilInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfilInfoView3(viewModel: .constant(ProfilInfoViewModel2(state: store.state, dispatch: store.dispatch(action:))))
    }
}
