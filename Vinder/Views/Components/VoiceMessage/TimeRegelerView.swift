//
//  TimeRegelerView.swift
//  Vinder
//
//  Created by Patrick Fischer on 30.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI

/*
 Zeichne Linie, Setze Regeler auf Linie, abhängig davon wie viel Prozent schon abgespielt worden ist.
 Links unten: Zeige zusätzlich die noch zu spielende Zeit an.
 Rechts unten: Zeige Zeit an an der die Nachricht empfangen wurde
 */
struct TimeRegelerView: View {
    
    @State var circlePercentage: CGFloat = 0.5
    
    func createCirle() -> some View {
        return Circle().fill(Color.blue)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
                }
                .stroke(Color.gray, lineWidth: 3)
                Circle()
                    .fill(Color.blue)
                    //                .draggable()
                   
                    .frame(width: 10, height: 10)
                .draggableX(CGPoint(x: 0, y: 0))
                .position(CGPoint(x: 0, y: geometry.size.height / 2))
                    

            }
        }
    }
}

struct TimeRegelerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRegelerView().frame(width: 200, height: 200, alignment: .center)
    }
}
