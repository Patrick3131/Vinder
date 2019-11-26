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
    
    struct UpdateImage: AsyncAction {
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
                        let updater = FirebaseProfilUpdater()
                        var urls = self.profile.pictureUrl
                        urls.append(url)
                        updater.profilUpdate(id: self.profile.id, update: .prictureUrl(urls: urls), completion: { result in
                            switch result {
                            case .success:
                                dispatch(SetImageUrl(url: url))
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        })
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
        let profile: Profile
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let imageService = ImageService()
            imageService.delete(url.absoluteString, completion: { result in
                switch result {
                case .success:
                    let updater = FirebaseProfilUpdater()
                    var urls = self.profile.pictureUrl
                    urls.remove(at: self.imageIndex)
                    updater.profilUpdate(id: self.profile.id, update: .prictureUrl(urls: urls), completion: { result in
                        switch result {
                        case .success:
                            dispatch(RemoveImageState(imageIndex: self.imageIndex))
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        
                    })
                    
                case .failure:
                    break
                }
                
            })
        }
    }
    
    struct UpdateAudio: AsyncAction {
        let profile: Profile
        let data: Data
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let audioService = AudioService()
            
            audioService.create(data, profil: profile, completion: { result in
                switch result {
                case .success(let url):
                    let updater = FirebaseProfilUpdater()
                    if let url = URL(string: url) {
                        updater.profilUpdate(id: self.profile.id, update: .biography(url: url), completion: { result in
                            switch result {
                            case .success:
                                dispatch(SetBioUrl(url: url))
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        })
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            })
        }
    }
    
    struct UpdateGender:AsyncAction {
        let profile: Profile
        let index: Int
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let updater = FirebaseProfilUpdater()
            updater.profilUpdate(id: profile.id, update: .gender(gender: Profile.Gender.getGender(index: index)), completion: { result in
                switch result {
                case .success:
                    dispatch(SetGender(gender: Profile.Gender.getGender(index: self.index)))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
        
        
    }
    
    struct UpdatePreference: AsyncAction {
        let profile: Profile
        let index: Int
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let updater = FirebaseProfilUpdater()
            updater.profilUpdate(id: profile.id, update: .preference(preference: Profile.Preference.getPreference(index: index)), completion: { result in
                switch result {
                case .success:
                    dispatch(SetPreference(preference: Profile.Preference.getPreference(index: self.index)))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    
    struct UpdateName: AsyncAction {
        let profile: Profile
        let name: String
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let updater = FirebaseProfilUpdater()
            updater.profilUpdate(id: profile.id, update: .name(name: name), completion: { result in
                switch result {
                case .success:
                    dispatch(SetName(name: self.name))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    struct PlayAudio: Action {
        
    }
    
    struct RemoveImageState: Action {
        let imageIndex: Int
    }
    
    
    
    struct UploadStatus:Action {
        let status: ImageProcessingStatus
    }
    
    struct ShowImagePicker: Action {
        let show: Bool
    }
    
    struct SetName: Action {
        let name: String
    }
    struct SetImageUrl: Action {
        let url: URL
    }
    
    struct SetBioUrl: Action {
        let url: URL
    }
    
    struct SetGender: Action {
        let gender: Profile.Gender
    }
    
    struct SetPreference: Action {
        let preference: Profile.Preference
    }
    
    struct ShowRecordingDetailView: Action {
        let show: Bool
    }
    
    struct BioRecording: Action {
        let recording: Bool
        let profile: Profile
    }
}
