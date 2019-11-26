//
//  ProfileReading.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

protocol ProfileReading {
    func profileRead(id: String, completion: @escaping (Result<Profile,Error>) -> Void)
    func profileReads(ids: [String], completion: @escaping (Result<[Profile],Error>) -> Void)
}


