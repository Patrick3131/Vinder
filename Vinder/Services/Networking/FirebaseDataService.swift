//
//  DataService.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import FirebaseStorage

struct FirebaseDataService: DataNetworking {
    let storage: Storage
    
    func create(_ data: Data, profil: Profile, config: DataServiceConfig, completion: @escaping (Result<String, Error>) -> Void) {
        let reference = storage.reference(withPath: config.path + "/" + "\(profil.id)" + "\(profil.pictureUrl.count + 1)")
                let metadata = StorageMetadata()
                metadata.contentType = config.contentType
                reference.putData(data, metadata: metadata, completion: { (meta, error) in
                    
                    if error == nil {
                        reference.downloadURL(completion: { url, error in
                            if let error = error {
                                print(error.localizedDescription)
                                
                            } else if let url = url {
                                completion(.success(url.absoluteString))
                            }
                            
                        })
                        
                    } else {
                        
                        print(error?.localizedDescription as Any)
                    }
                })
    }
    
    func delete(_ url: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let reference = storage.reference(forURL: url)
        reference.delete { error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                print(url,"deleted")
                completion(.success(true))
            }
        }
    }
    
    func read(_ urls: [String], completion: @escaping (Result<[Data], Error>) -> Void) {
        var dataOutput = [Data]()
        for url in urls {
            let reference = storage.reference().child(url)
            
            reference.getData(maxSize: 1 * 1024 * 1024, completion: { data, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    dataOutput.append(data!)
                }
            })
        }
        completion(.success(dataOutput))
    }
    
}

extension FirebaseDataService {
    init() {
        self.storage = Storage.storage()
    }
}
