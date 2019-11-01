//
//  SwipingView.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct SwipingViewModel {
    let profilesToSwipe: [String]
    let dispatch: DispatchFunction
    
    var areThereAnyProfilesToSwipe: Bool {
        return !profilesToSwipe.isEmpty
    }
    
    func swipeLeft() {
        
    }
    
    func swipeRight() {
        
    }
    
    func popCurrentProfil() {
        if let first = profilesToSwipe.first {
            dispatch(SwipingActions.PopFirstProfile(id: first))
        }
    }
    
    func loadNewMatches() {
        
    }
    
}

struct SwipingView: ConnectedView {
 
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .soft)
    
    @State private var draggedViewState = SwipeableView<CardView>.DragState.inactive
    @State private var willEndPosition: CGSize? = nil
    struct Props {
        var viewModel: SwipingViewModel
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(viewModel: SwipingViewModel(profilesToSwipe: state.swipingState.profilesToSwipe, dispatch: dispatch))
    }
    
    private func draggableCardViewEndGestureHandler(props: Props, handler: SwipeableView<CardView>.EndState) {
        if handler == .left || handler == .right {
            if handler == .left {
                hapticFeedback.impactOccurred(intensity: 0.8)
                props.viewModel.swipeLeft()
            } else {
                hapticFeedback.impactOccurred(intensity: 0.8)
                props.viewModel.swipeRight()
            }
            props.viewModel.popCurrentProfil()
            willEndPosition = nil
            props.viewModel.loadNewMatches()
        }
    }
    
    func body(props: Props) -> some View {
        GeometryReader { geometry in
            Group {
                if props.viewModel.areThereAnyProfilesToSwipe {
                    VStack {
                        ZStack {
                            ForEach(props.viewModel.profilesToSwipe, id: \.self) { id in
                                SwipeableView(
                                    gestureViewState: self.$draggedViewState,
                                    onTabGesture: {
                                        print("123")
                                },
                                    willEndGesture: { position in
                                        self.willEndPosition = position
                                },
                                    endGestureHandler: { handler in
                                        self.draggableCardViewEndGestureHandler(props: props, handler: handler)
                                },
                                    viewBuilder: {
                                        CardView(profilID: id)
                                })
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                                    .padding([.horizontal,.top])
                            }
                        }
                    }
                } else {
                    VStack {
                        AnimatedPlaceholder(image: "latina5", color: .blue)
                    }
                }
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


struct SwipingView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingView().environmentObject(store)
    }
}
