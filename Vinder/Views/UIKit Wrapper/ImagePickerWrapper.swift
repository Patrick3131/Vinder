//
//  ImagePickerWrapper.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import UIKit
import SwiftUI

///https://stackoverflow.com/questions/56515871/how-to-open-the-imagepicker-in-swiftui

struct ImagePickerWrapper: UIViewControllerRepresentable {

    @Environment(\.presentationMode)
    var presentationMode
    var selectedImage: (UIImage?) -> Void


    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding var presentationMode: PresentationMode
        var selectedImage: (UIImage?) -> Void
        
        init(presentationMode: Binding<PresentationMode>, selectedImage: @escaping (UIImage?) -> Void) {
            _presentationMode = presentationMode
            self.selectedImage = selectedImage
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            selectedImage(uiImage)
            presentationMode.dismiss()

        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            selectedImage(nil)
            presentationMode.dismiss()
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, selectedImage: { image in
            self.selectedImage(image)
        })
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerWrapper>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePickerWrapper>) {

    }

}
