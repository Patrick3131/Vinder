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
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let uploader = ImageService()
            
            uploader.create(image, profil: profile, completion: { success, url in
                
                dispatch(UploadStatus(status: .imageIsProcessing(index: 0)))
                if success {
                    if let url = URL(string: url) {
                        dispatch(SetImageUrl(url: url))
                    }
                } else {
                  print("upload failed")
                }
            })
//            let uploader =
        }
    }
    
    struct RemoveImage: AsyncAction {
        let imageIndex: Int
        let url: URL
        
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let imageService = ImageService()
            imageService.delete(url.absoluteString, completion: { successful in
                if successful {
                    dispatch(RemoveImageState(imageIndex: self.imageIndex))
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
        let status: ProfileUpdateState.ImageProcessingStatus
    }
    
    struct ShowImagePicker: Action {
        let show: Bool
    }
}
