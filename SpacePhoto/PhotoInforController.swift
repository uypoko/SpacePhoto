//
//  PhotoInforController.swift
//  SpacePhoto
//
//  Created by Ryan on 6/17/19.
//  Copyright © 2019 Equity. All rights reserved.
//

import Foundation
struct PhotoInfoController {

    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = [
            "api_key": "DEMO_KEY",
        ]
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}

