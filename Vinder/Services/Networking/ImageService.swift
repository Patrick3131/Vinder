//
//  ImageService.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage


struct ImageService: ImageNetworking {
    
    let storage = Storage.storage()
    var dataService: DataService
    
    func create(_ image: UIImage, profil: Profile, completion: @escaping (_ hasFinished: Bool, _ url: String) -> Void) {
        let data: Data? = image.jpegData(compressionQuality: 1.0)
        if let data = data {
            dataService.create(data, profil: profil, mainPath: "media", completion: { hasFinished, url in
                completion(hasFinished, url)
            })
        }
    }
    
    func delete(_ url: String) {
        dataService.delete(url)
    }
    
    func read(_ urls: [String], completion: @escaping ([UIImage]) -> Void) {
        dataService.read(urls, completion: { data in
            let images = data.map { UIImage(data: $0) }.compactMap { $0 }
            completion(images)
        })
    }
    
    
}


