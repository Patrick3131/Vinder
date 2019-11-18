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
//    private lazy var profilUpdater = FirebaseProfilUpdater()
    init() {

    }
    
    func provideMiddleware() -> [Middleware<FluxState>] {
        return [
            loggingMiddleware(),
            locationTrackingMiddleware(),
            firebaseAUTHMiddleware()
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
                            profilUpdater.profilUpdate(id: userID, update: .location(location: result), completionHandler: { success in
                                if success {
                                    next(LocationAction.setLocation(location: result))
                                } else {
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
