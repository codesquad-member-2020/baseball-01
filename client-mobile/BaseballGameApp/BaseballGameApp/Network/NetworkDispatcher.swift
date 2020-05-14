//
//  NetworkDispatcher.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

protocol NetworkDispatcher {
    func execute(request: Request, completion: @escaping (Result<Data, NetworkErrorCase>) -> ())
}

struct NetworkManager: NetworkDispatcher {
    func execute(request: Request, completion: @escaping(Result<Data, NetworkErrorCase>) -> Void) {
        guard let urlRequest = request.urlRequest() else { return }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completion(.failure(.InvalidURL))
            }
            guard let data = data else { return }
            completion(.success(data))
        }.resume()
    }
}
