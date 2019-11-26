//
//  AudioService.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import UIKit

struct AudioService: MediumNetworking {
  
    
    typealias myType = Data
    let dataService: FirebaseDataService
    
    func create(_ medium: myType, profil: Profile, completion: @escaping (Result<String, Error>) -> Void) {
        dataService.create(medium, profil: profil, config: MediumType.biography, completion: { result in
            completion(result)
        })
      }
      
      func delete(_ url: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        dataService.delete(url, completion: { result in
            completion(result)
        })
      }
      
      func read(_ urls: [String], completion: @escaping (Result<[myType], Error>) -> Void) {
        dataService.read(urls, completion: { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        })
      }
}

extension AudioService {
    init() {
        self.dataService = FirebaseDataService()
    }
}
