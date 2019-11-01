//
//  ProfilUpdateNetworking.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation


protocol ProfilUpdateNetworking {
    func profilUpdate(id: String, update: ProfileUpdate, completionHandler: @escaping ( _ success: Bool) -> Void)
    func profilUpdates(id: String, updates: [ProfileUpdate], completionHandler: @escaping (Bool) -> Void)
}
