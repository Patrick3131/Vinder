//
//  ProfileReading.swift
//  Vinder
//
//  Created by Patrick Fischer on 01.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

protocol ProfileReading {
    func profileRead(id: String, completionHandler: @escaping (_ profile: Profile, _ error: Error?) -> Void)
    func profileReads(ids: [String], completionHandler: @escaping (_ profiles: [Profile], _ error: Error?) -> Void)
}


