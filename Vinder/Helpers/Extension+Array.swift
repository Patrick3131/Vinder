//
//  Extension+Array.swift
//  Vinder
//
//  Created by Patrick Fischer on 11.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation


extension Array {
    func safeAccess(_ index: Int) -> Array.Element? {
        if index < self.count && index >= 0 {
            return self[index]
        }
        return nil
    }
}
