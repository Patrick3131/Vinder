//
//  AuthViewController+Extension.swift
//  Vinder
//
//  Created by Patrick Fischer on 17.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import FirebaseUI
import SwiftUI

struct FUIAuthBaseViewControllerWrapper: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<FUIAuthBaseViewControllerWrapper>) -> UIViewController {
         let authUI = FUIAuth.defaultAuthUI()
//               authUI?.delegate = self
               
               let providers = [FUIEmailAuth()]
               authUI?.providers = providers
        let authViewController = (authUI?.authViewController())!
        return authViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<FUIAuthBaseViewControllerWrapper>) {
        
    }
}
