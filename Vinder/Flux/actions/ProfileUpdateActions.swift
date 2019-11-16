//
//  UpdateProfileActions.swift
//  Vinder
//
//  Created by Patrick Fischer on 13.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux
import UIKit

struct ProfileUpdateActions {
    struct SelecteImage: Action {
        var image: UIImage
        
    }
    
    struct UploadImage: AsyncAction {
        let image: UIImage
        let profile: Profile
        let element: Int
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let uploader = ImageService()
            dispatch(UploadStatus(status: .imageIsProcessing(index: self.element)))

            uploader.create(image, profil: profile, completion: { result in
                switch result {
                case .success(let url):
                    if let url = URL(string: url) {
                        dispatch(SetImageUrl(url: url))
                    }
                    dispatch(UploadStatus(status: .isReady))

                case .failure(let error):
                    print("upload failed", error.localizedDescription)
                    dispatch(UploadStatus(status: .isReady))
                    break
                }
            })
        }
    }
    
    struct RemoveImage: AsyncAction {
        let imageIndex: Int
        let url: URL
        
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let imageService = ImageService()
            imageService.delete(url.absoluteString, completion: { result in
                switch result {
                case .success:
                    dispatch(RemoveImageState(imageIndex: self.imageIndex))
                    
                case .failure:
                    break
                }
                
            })
        }
    }
    
    struct RemoveImageState: Action {
        let imageIndex: Int
    }
    
    struct SetImageUrl: Action {
        let url: URL
    }
    
    struct UploadStatus:Action {
        let status: ImageProcessingStatus
    }
    
    struct ShowImagePicker: Action {
        let show: Bool
    }
    
    struct ChangeGender: Action {
        let index: Int
    }
    
    struct ChangePreference: Action {
        let index: Int
    }
}
