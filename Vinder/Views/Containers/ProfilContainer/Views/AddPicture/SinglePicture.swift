//
//  AddSinglePicture.swift
//  Vinder
//
//  Created by Patrick Fischer on 02.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import SwiftUI

struct SinglePictureViewModel {
    var picture: URL?
    var onTab: (Tabbed) -> Void
    func addPicture() {
        onTab(.add)
    }
    
    func removePicture() {
        onTab(.remove)
    }
    
    var isThereAPictureAdded: Bool {
        (picture != nil)
    }
    
    enum Tabbed {
        case add
        case remove
        case show
    }
}

struct SinglePicture: View {
    var viewModel: SinglePictureViewModel
    var color: Color = .green
    var body: some View {
        Group {
            ZStack(alignment: .bottomTrailing) {
                Button(action: {
                    if !self.viewModel.isThereAPictureAdded {
                        self.viewModel.addPicture()
                    }
                }) {
                    Group {
                        if viewModel.isThereAPictureAdded {
                            ZStack {
                                CacheImage(viewModel.picture!)
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .center)
                            }
                            
                        } else {
                            Image(systemName: "plus.circle")
                        }
                    }
                }.frame(width: 100, height: 100, alignment: .center)
                    .buttonStyle(PlainButtonStyle())
                    .clipShape(Circle())
                    .overlay(Circle().stroke(color.opacity(0.5),lineWidth: 5))
                if viewModel.isThereAPictureAdded {
                    Button(action: {
                        self.viewModel.removePicture()
                    }) {
                        Image(systemName: "minus.circle")
                    }.buttonStyle(PlainButtonStyle())
                        .foregroundColor(.gray)
                }
            }
        }
        
    }
    
}


struct AddSinglePicture_Previews: PreviewProvider {
    static var previews: some View {
        let string = "https://firebasestorage.googleapis.com/v0/b/vinder-cb83a.appspot.com/o/pictures%2Funnamed.jpg?alt=media&token=4742954b-3820-453c-be73-ba01f1b9fe5e"
        let url = URL(string: string)
        return SinglePicture(viewModel: (SinglePictureViewModel(picture: url, onTab: {_ in
            
        })))
    }
}






