//
//  DataServiceConfig.swift
//  Vinder
//
//  Created by Patrick Fischer on 15.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation


protocol DataServiceConfig {
    var path: String { get }
    var contentType: String { get }
}
