//
//  MessageContainer.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.01.20.
//  Copyright © 2020 Patrick Fischer. All rights reserved.
//

import SwiftUI
import SwiftUIFlux


struct MessageContainer: ConnectedView {
    
    struct Props {
        
    }
    
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> MessageContainer.Props {
        Props()
    }
    
    func body(props: Props) -> some View {
        Text("")
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MessageContainer_Previews: PreviewProvider {
    static var previews: some View {
        MessageContainer().environmentObject(store)
    }
}
