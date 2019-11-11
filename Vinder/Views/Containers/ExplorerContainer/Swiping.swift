//
//  Swiping.swift
//  Vinder
//
//  Created by Patrick Fischer on 24.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

protocol Swiping {
    func like(_ completion: @escaping (_ successful: Bool, _ error: Error) -> Void)
    func doNotLike(_ completion: @escaping (_ successful: Bool, _ error: Error) -> Void)
}
