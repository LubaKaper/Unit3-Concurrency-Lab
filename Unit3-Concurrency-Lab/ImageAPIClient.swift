//
//  ImageAPIClient.swift
//  Unit3-Concurrency-Lab
//
//  Created by Liubov Kaper  on 12/9/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

struct ImageAPIClient {
    static func getImageURL(for imageURL: String, competion: @escaping (Result<UIImage?, Error>) ->()) {
           
            NetworkHelper.shared.performDataTask(with: imageURL) { (result) in
                switch result {
                case .failure(let appError):
                    competion(.failure(appError))
                case .success(let data):
                    let image = UIImage(data: data)
                    competion(.success(image))
                }
            }
    
    
        }
}
