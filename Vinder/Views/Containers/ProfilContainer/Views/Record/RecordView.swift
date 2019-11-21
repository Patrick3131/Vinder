//
//  RecordView.swift
//  Vinder
//
//  Created by Patrick Fischer on 19.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct RecordView: View {
    @State private var timePassed = 0
    var timeLimit: Int = 90
    var action: (Status) -> Void
    enum Status {
        case play
        case timePassed(Int)
        case stoppedRecording
        case done
        case redo
    }
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private func formatting(time: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute,.second]
        let formattedString = formatter.string(from: TimeInterval(time))
        return formattedString ?? ""
    }
    //    var animation =
    var body: some View {
        
        VStack(spacing: 10) {
            Text(formatting(time: timePassed)).onReceive(timer) { _ in
                if self.timePassed < 90 {
                    self.timePassed += 1
                } else {
                    self.action(.timePassed(self.timePassed))
                }
            }.font(.some(Font.system(size: 90)))
            VStack(spacing: 20) {
                HStack(spacing: 32) {
                    Button(action: {
                        self.action(.play)
                    }, label: {
                        Image(systemName: "play.circle")
                    })
                    
                    Button(action: {
                        self.action(.stoppedRecording)
                    }, label: {
                        Image(systemName: "pause.circle")
                    })
                    
                    Button(action: {
                        self.action(.redo)
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                    })
                }
                Button(action: {
                    self.action(.done)
                }, label: {
                    Text("Done").foregroundColor(.gray)
                })
                    .frame(width: 50, height: 18, alignment: .center)
                    .padding([.horizontal], 30)
                    .padding([.vertical], 10)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 2))
            }
        }.frame(width: 200, height: 210, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.blue, lineWidth: 5))
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(action: { _ in
            
        })
    }
}
