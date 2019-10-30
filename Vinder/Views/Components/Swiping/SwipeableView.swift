//
//  SwipeableView.swift
//  Vinder
//
//  Created by Patrick Fischer on 29.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct SwipeableView<Content:View>: View {
    
    
    enum DragState {
        case inactive, pressing
        case dragging(translation:CGSize, predictedLocation: CGPoint)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let data):
                return data.translation
            }
        }
        
        var predictedLocation: CGPoint {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let data):
                return data.predictedLocation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive,.pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    enum EndState {
        case left, right, cancelled
    }
    
    // MARK: - Internal vars
    @State private var predictedEndLocation: CGPoint? = nil
    @State private var hasMoved = false
    @State private var delayedIsActive = false
    @GestureState private var dragState: DragState = .inactive
    private let hapticFeedback = UISelectionFeedbackGenerator()
    
    // MARK: - Internal consts
    private let minimumLongPressDuration = 0.01
    private let shadowSize: CGFloat = 4
    private  let shadowRadius: CGFloat = 16
    
    // MARK: - Constructor vars
    @Binding var gestureViewState: DragState
    let onTabGesture: () -> Void
    let willEndGesture: (CGSize) -> Void
    let endGestureHandler: (EndState) -> Void
    let viewBuilder: () -> Content
    
    
    // MARK: - Viewd functions
    
    private func computedOffSet() -> CGSize {
        if let location = predictedEndLocation {
            return CGSize(width: location.x, height: 0)
        }
        return CGSize(
            width: dragState.isActive ? dragState.translation.width : 0,
            height: 0)
    }
    
    private func computeAngle() -> Angle {
        if let location = predictedEndLocation {
            return Angle(degrees: Double(location.x / 15))
        }
        return Angle(degrees: Double(dragState.translation.width / 15))
    }
    
    private var coverSpringAnimation: Animation {
        .interpolatingSpring(mass: 1, stiffness: 150, damping: 15, initialVelocity: 5)
    }
    
    private func slideOut() {
        // case left
    
        // case right
    }
    
    private func slideRight() {
        
    }
    
    private func slideLeft() {
        
    }
    
    private func gestureOnChanged() {
        self.delayedIsActive = true
        if self.dragState.translation.width == 0.0 {
            self.hasMoved = false
            self.gestureViewState = .pressing
        } else {
            self.hasMoved = true
            self.gestureViewState = .dragging(translation: self.dragState.translation, predictedLocation: self.dragState.predictedLocation)
            print(self.gestureViewState.predictedLocation)
        }
    }
    
    private func gestureOnEnded() {
        let endLocation = self.gestureViewState.predictedLocation
        print(endLocation.x)
        
        if endLocation.x < -150 {
            self.predictedEndLocation = endLocation
            self.willEndGesture(self.gestureViewState.translation)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.endGestureHandler(.right)
            }
        } else if endLocation.x > UIScreen.main.bounds.width - 50 {
            self.predictedEndLocation = endLocation
            self.willEndGesture(self.gestureViewState.translation)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.endGestureHandler(.right)
            }
        } else {
            self.endGestureHandler(.cancelled)
        }
        self.gestureViewState = .inactive
    }
    
    private func gestureOnUpdateing(value:SequenceGesture<LongPressGesture, DragGesture>.Value,state: inout SwipeableView<Content>.DragState) {
        switch value {
        case .first(true):
            state = .pressing
            self.hapticFeedback.selectionChanged()
        case .second(true, let drag):
            state = .dragging(translation: drag?.translation ?? .zero, predictedLocation: drag?.predictedEndLocation ?? .zero)
        default:
            state = .inactive
        }
    }
    
    var body: some View {
        let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                self.gestureOnUpdateing(value: value, state: &state)
        }.onChanged { value in
            self.gestureOnChanged()
        }.onEnded { value in
            self.gestureOnEnded()
        }
        return viewBuilder()
        .offset(computedOffSet())
            .animation(delayedIsActive ? coverSpringAnimation : nil)
            .opacity(predictedEndLocation != nil ? 0 : 1)
        .rotationEffect(computeAngle())
            .scaleEffect(dragState.isActive ? 1.03 : 1)
            .shadow(color: .secondary, radius: dragState.isActive ? shadowRadius : 0, x: dragState.isActive ? shadowRadius : 0, y: dragState.isActive ? shadowRadius : 0)
        .animation(coverSpringAnimation)
        .gesture(longPressDrag)
            .simultaneousGesture(TapGesture(count: 1).onEnded({ _ in
            if !self.hasMoved {
                self.onTabGesture()
            }
        }))
            .onAppear {
                self.hapticFeedback.prepare()
        }
    }
}

struct SwipeableView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeableView(
            gestureViewState: .constant(.inactive),
            onTabGesture: {
                
        },
            willEndGesture: { _ in
                
        },
            endGestureHandler: { handler in
                
        },
            viewBuilder: {
                CardView(profilID: 1)
        })
    }
}
