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
    
    
    func create(_ image: UIImage, profil: Profile, completion: @escaping (Bool, String) -> Void) {
        let data: Data? = image.jpegData(compressionQuality: 1.0)
        if let data = data {
            let reference = storage.reference(withPath: "media/" + "\(profil.id)" + "\(profil.pictureUrl.count + 1)")
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
    
    func read(_ urls: [String], completion: @escaping ([UIImage]) -> Void) {
        var images = [UIImage]()
        for url in urls {
            let reference = storage.reference().child(url)
            
            reference.getData(maxSize: 1 * 1024 * 1024, completion: { data, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    let newImage = UIImage(data: data!)
                    images.append(newImage!)
                }
            })
        }
        completion(images)
    }
    
    
}
