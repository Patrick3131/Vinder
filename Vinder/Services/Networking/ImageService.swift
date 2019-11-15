//
//  ImageService.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import UIKit





struct ImageService: ImageNetworking {

    var dataService: DataNetworking
    
    
    func test(completion: @escaping (Result<Bool, Error>) -> Void ) {
        
    }
    
    func create(_ image: UIImage, profil: Profile, completion: @escaping (_ hasFinished: Bool, _ url: String) -> Void) {
        let data: Data? = image.jpegData(compressionQuality: 0.5)
        if let data = data {
            dataService.create(data, profil: profil, config: .image, completion: { hasFinished, url in
                completion(hasFinished, url)
            })
        }
    }
    
    func delete(_ url: String, completion: @escaping (_ successful: Bool) -> Void) {
        dataService.delete(url, completion: { successful in
            completion(successful)
            
        })
    }

    
    func read(_ urls: [String], completion: @escaping ([UIImage]) -> Void) {
        dataService.read(urls, completion: { data in
            let images = data.map { UIImage(data: $0) }.compactMap { $0 }
            completion(images)
        })
    }
}

extension ImageService {
    init() {
        self.dataService = FirebaseDataService()
    }
}
