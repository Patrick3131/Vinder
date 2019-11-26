//
//  ImageService.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import UIKit





struct ImageService: MediumNetworking {
    typealias Medium = UIImage
    var dataService: DataNetworking
    
    func create(_ medium: Medium, profil: Profile, completion: @escaping (Result<String, Error>) -> Void) {
        let data: Data? = medium.jpegData(compressionQuality: 0.5)
        if let data = data {
            dataService.create(data, profil: profil, config: MediumType.image, completion: { result in
                completion(result)
            })
        }
    }
    
    func delete(_ url: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        dataService.delete(url, completion: { result in
            completion(result)
        })
    }
    
    func read(_ urls: [String], completion: @escaping (Result<[Medium], Error>) -> Void) {
        dataService.read(urls, completion: { result in
            switch result {
            case .success(let data):
                let images = data.map { UIImage(data: $0) }.compactMap { $0 }
                completion(.success(images))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    

    
    
}

extension ImageService {
    init() {
        self.dataService = FirebaseDataService()
    }
}
