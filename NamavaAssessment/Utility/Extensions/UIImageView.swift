//
//  UIImageView.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/15/23.
//

import UIKit

extension UIImageView {
    var cacheManager: CachingManager {
        return CachingManager.shared
    }
    
    func load(url: URL) {
        let path = url.path
        if let image = cacheManager.getImageFromCache(key: path) {
            self.image = image
        } else {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                            self?.cacheManager.saveImageToCache(image: image, key: path)
                        }
                    }
                }
            }
        }
    }
}
