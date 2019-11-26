//
//  ProfilUpdateNetworking.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation


protocol ProfilUpdating {
    func profilUpdate(id: String, update: ProfileUpdate, completion: @escaping (Result<Bool,Error>) -> Void)
    func profilUpdates(id: String, updates: [ProfileUpdate], completion: @escaping (Result<Bool,Error>) -> Void)
}




