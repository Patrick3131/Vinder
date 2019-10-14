//
//  CRUDMessage.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation

protocol CRDMessage {
    func createMessage(_ message: Message)
    func readMessages(completionHandler: @escaping ([Message]) -> Void)
    func deleteMessage(_ message: Message)
}
