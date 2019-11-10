//
//  Store.swift
//  Vinder
//
//  Created by Patrick Fischer on 26.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import SwiftUIFlux
import UIKit



var store: Store<AppState> {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    return appdelegate.store
}
