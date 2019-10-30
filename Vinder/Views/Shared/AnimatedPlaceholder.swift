//
//  AnimatedPlaceholder.swift
//  Vinder
//
//  Created by Patrick Fischer on 30.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct AnimatedPlaceholder: View {
    var image: String
    var color: Color
    var repeatedAnimation: Animation {
        Animation.linear(duration: 2)
        .repeatForever()
    }
    @State var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle().foregroundColor(self.color)
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
                    .scaleEffect(self.isAnimating ? 2 : 1)
                    .opacity(self.isAnimating ? 0 : 0.5)
                    .onAppear() {
                        withAnimation(self.repeatedAnimation) {
                            self.isAnimating = true
                        }
                }
                Image(self.image)
                .resizable()
                .clipShape(Circle())
                    .overlay(Circle().stroke(self.color.opacity(0.5),lineWidth: 5))
                .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
            }
        }
        
    }
}

struct AnimatedPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedPlaceholder(image: "latina5", color: .blue)
    }
}
