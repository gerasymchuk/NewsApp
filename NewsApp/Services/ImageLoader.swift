//
//  ImageLoader.swift
//  NewsApp
//
//  Created by Misha on 08.09.2021.
//

import Foundation

class ImageLoader {
    
    static let shared = ImageLoader()
    let imageCache = NSCache<NSString, NSData>()
    
    
    func getImage(from stringURL: String, completion: @escaping (Data?) -> Void) {
        guard let url =  URL(string: stringURL) else {
            completion(nil)
            return
        }
        //check if the image already exists in cache
        if let cachedImage = imageCache.object(forKey: NSString(string: stringURL)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: stringURL))
                completion(data)
            }.resume()
        }
        
    }
}
