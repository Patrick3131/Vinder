//
//  CRUDMessage.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import UIKit

protocol CRUD {
    associatedtype myType
    func create(_ valueToCreate: myType)
    func read(_ completionHandler: @escaping ([myType]) -> Void)
    func update(_ valueToUpdate: myType)
    func delete(_ valueToDelete: myType)
}


struct Networking: CRUD {
    
    typealias myType = Message

    
    func create(_ createValue: Message) {
    }
    
    func read(_ completionHandler: @escaping ([Message]) -> Void) {
    }
    
    func update(_ updatedValue: Message) {
    }
    
    func delete(_ deletedValue: Message) {
    }
    
}

protocol ImageNetworking {
    func create(_ image: UIImage, completion: @escaping (_ hasFinished: Bool, _ url: String) -> Void)
    func delete(_ url: String)
    func read(_ urls: [String], completion: @escaping ([UIImage]) -> Void)
}

protocol CRDMessage {
    func createMessage(_ message: Message)
    func readMessages(completionHandler: @escaping ([Message]) -> Void)
    func deleteMessage(_ message: Message)
}
