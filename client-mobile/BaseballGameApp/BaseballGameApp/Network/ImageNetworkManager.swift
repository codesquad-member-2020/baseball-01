//
//  ImageNetworkManager.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

struct ImageNetworkManager {
    
    static func fetchImage(from: String, cachedImageFileURL: URL? = nil, completion: @escaping (UIImage?) -> Void) {
        
        let defaultImage: UIImage? = UIImage(named: "logo.default")
        let URLRequest = URL(string: from)!
        
        URLSession.shared.downloadTask(with: URLRequest) { (url, _, error) in
            if error != nil { completion(defaultImage) }
            guard let url = url else { completion(defaultImage); return }
            guard let data = try? Data(contentsOf: url) else { completion(defaultImage); return }
            
            // temp url의 data를 cachedImageFileURL에 저장
            if let cachedImageFileURL = cachedImageFileURL {
                try? FileManager.default.moveItem(at: url, to: cachedImageFileURL)
            }
            completion(UIImage(data: data))
        }.resume()
    }
}
