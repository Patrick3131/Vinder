//
//  DataService.swift
//  Vinder
//
//  Created by Patrick Fischer on 14.10.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import FirebaseStorage

struct DataService: DataNetworking {
    let storage: Storage
    
    func create(_ data: Data, profil: Profile, mainPath: String, completion: @escaping (_ hasFinished: Bool, _ url: String) -> Void) {
        let reference = storage.reference(withPath: "mainPath" + "/" + "\(profil.id)" + "\(profil.pictureUrl.count + 1)")
        reference.putData(data, metadata: nil, completion: { (meta, error) in
            if error == nil {
                meta?.storageReference?.downloadURL(completion: { (url, error) in
                    if error == nil {
                        completion(true, url?.absoluteString ?? "")
                    } else {
                        print(error?.localizedDescription as Any)
                    }
                })
            } else {
                print(error?.localizedDescription as Any)
            }
        })
    }
    
    
    func delete(_ url: String) {
        let reference = storage.reference(forURL: url)
        reference.delete { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print(url,"deleted")
            }
        }
    }
    
    func read(_ urls: [String], completion: @escaping ([Data]) -> Void) {
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
    }
}
