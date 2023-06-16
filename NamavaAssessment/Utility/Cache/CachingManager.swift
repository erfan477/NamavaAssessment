//
//  ImageCacher.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/16/23.
//

import UIKit

class CachingManager {
    static let shared: CachingManager = CachingManager()
    private init () {}
    
    private let cache = NSCache<NSString, UIImage>()
    
    func saveImageToCache(image: UIImage, key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func getImageFromCache(key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
    
    func getCacheSize() -> Int {
        return cache.totalCostLimit
    }
}
