//
//  MatchStatusUserCase.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct MatchStatusUseCase {
    struct MatchStatusRequest: Request {
        var path: String
    }
    
    struct MatchStatusTask: NetworkTask {
        typealias Output = Result<MatchStatus, NetworkErrorCase>
        
        private let networkDispatcher: NetworkDispatcher
        
        init(networkDispatcher: NetworkDispatcher) {
            self.networkDispatcher = networkDispatcher
        }
        
        func perform(_ request: Request, completion: @escaping (Result<MatchStatus, NetworkErrorCase>) -> Void) {
            networkDispatcher.execute(request: request) { (result) in
                switch result {
                case .success(let data):
                    guard let matchStatus = try? JSONDecoder().decode(MatchStatus.self, from: data) else { return }
                    completion(.success(matchStatus))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func requestMatchStatus(matchIdentifier: Int,
                                   with matchStatusTask: MatchStatusTask,
                                   completion: @escaping (Result<MatchStatus, NetworkErrorCase>) -> Void) {
        let matchStatusRequest = MatchStatusRequest(path: "http://52.79.100.252:8080/matches/\(matchIdentifier)")
        matchStatusTask.perform(matchStatusRequest) { (result) in
            completion(result)
        }
    }
}
