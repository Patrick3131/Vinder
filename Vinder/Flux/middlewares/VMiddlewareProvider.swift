//
//  VMiddlewareProvider.swift
//  Vinder
//
//  Created by Patrick Fischer on 07.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

import Foundation
import SwiftUIFlux
import FirebaseAuth

class VMiddlewareProvider: MiddlewareProvider {
    
    private lazy var location = TrackLocation()
    private lazy var audioRecorder = AudioRecorder()
    private lazy var audioPlayer = AudioPlayer()
//    private lazy var profilUpdater = FirebaseProfilUpdater()
    init() {

    }
    
    func provideMiddleware() -> [Middleware<FluxState>] {
        return [
            loggingMiddleware(),
            locationTrackingMiddleware(),
            firebaseAUTHMiddleware(),
            audioRecordingMiddleware()
        ]
    }
    
    
    /// Mark: -  LoggingMiddleware
    private func loggingMiddleware() -> Middleware<FluxState> {
        let loggingMiddleware: Middleware<AppState> = { dispatch, getState in
            return { next in
                return { action in
                    #if DEBUG
                    let name = __dispatch_queue_get_label(nil)
                    let queueName = String(cString: name, encoding: .utf8)
                    print("#Action: \(String(reflecting: type(of: action))) on queue: \(queueName ?? "??")")
                    #endif
                    return next(action)
                }
            }
        }
        return loggingMiddleware
    }
    
    
    private func audioRecordingMiddleware() -> Middleware<FluxState> {
        { dispatch, getState in
            return { next in
                return { action in
                        
                    switch action {
                        
                    case let action as ProfileUpdateActions.BioRecording:
                        if action.recording {
                            
                            self.audioRecorder.record(name: "test")
                            self.audioRecorder.newRecording = { result in
                                switch result {
                                case .success(let url):
                                    do {
                                        next(ProfileUpdateActions.UpdateAudio(profile: action.profile, data: try Data(contentsOf: url)))
                                    } catch let error {
                                        print(error)
                                    }
                                    
                                case .failure:
                                    break
                                }
                            }
                        } else {
                            self.audioRecorder.stop()
                        }
                        break
                    default:
                        break
                        
                    }
                    return next(action)
                }
            }
        }
    }
    
    private func audioPlayerMiddleware() -> Middleware<FluxState> {
        let middleware: Middleware<AppState> = { dispatch, getState in
            return { next in
                return { action in
                    switch action {
                    case let action as ProfileUpdateActions.PlayAudio:
                        self.audioPlayer.play(data: action.data)
                        self.audioPlayer.playing = { result in
                            switch result {
                            case .success:
                                break
                            case .failure(let error):
                                print(error)
                            }
                            
                        }
                    default:
                        next(action)
                    }
                }
                
            }
            
        }
        return middleware
    }
    
    /// Mark: - LocationTrackingMiddleware
    private func locationTrackingMiddleware() -> Middleware<FluxState> {
        let middleware: Middleware<AppState> = { dispatch, getState in
            return { next in
                return { action in
                    switch action as? LocationAction {
                    case .trackLocation(let userID):
                        self.location.askForPermission()
                        self.location.startTrackingLocation()
                        self.location.newLocation = { result in
                            let profilUpdater = FirebaseProfilUpdater()
                            profilUpdater.profilUpdate(id: userID, update: .location(location: result), completion: { newResult in
                                switch newResult {
                                case .success:
                                    
                                    next(LocationAction.setLocation(location: result))
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    next(action)
                                }
                            })
                        }
                        return next(action)
                    default:
                        return next(action)
                    }
                    return next(action)
                }
            }
        }
        return middleware
    }
    
    private func firebaseAUTHMiddleware() -> Middleware<FluxState> {
        let firebaseMiddleware: Middleware<AppState> = { dispatch, getState in
            return { next in
                return { action in
                    switch action {
                    case _ as AccountActions.Authenticate:
                        Auth.auth()
                        _ = Auth.auth().addStateDidChangeListener {  (auth, user) in
                            if let user = user {

                                return next(AccountActions.AuthentificationAction(isLoggedIn: true, userUID: user.uid))
                            }  else {
                                return next(AccountActions.AuthentificationAction(isLoggedIn: false, userUID: nil))
                            }
                        }
                    default:
                        return next(action)
                    }
                }
            }
        }
        return firebaseMiddleware
    }
}
