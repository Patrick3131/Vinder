//
//  AppDelegate.swift
//  Vinder
//
//  Created by Patrick Fischer on 12.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import UIKit
import SwiftUIFlux

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let middlewareProvider = VMiddlewareProvider()
    lazy var store = Store<AppState>(reducer: appStateReducer, middleware:
        middlewareProvider.provideMiddleware()
    , state: AppState())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

