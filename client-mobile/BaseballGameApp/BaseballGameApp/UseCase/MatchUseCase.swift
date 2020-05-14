//
//  MatchUseCase.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct MatchListUseCase {
    struct MatchListRequest: Request {
        var path: String = "http://13.124.60.97:8080/matches"
    }
    
    struct MatchListTask: NetworkTask {
        typealias Output = Result<[Match]?, NetworkErrorCase>
        
        private let networkDispatcher: NetworkDispatcher
        
        init(networkDispatcher: NetworkDispatcher) {
            self.networkDispatcher = networkDispatcher
        }
        
        func perform(_ request: Request, completion: @escaping (Result<[Match]?, NetworkErrorCase>?) -> Void) {
            networkDispatcher.execute(request: request) { (result) in
                switch result {
                case .success(let data):
                    let matchList = try? JSONDecoder().decode([Match].self, from: data)
                    completion(.success(matchList))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
        static func getMatchList(from matchListRequest: MatchListRequest,
                                    with matchListTask: MatchListTask,
                                    completion: @escaping (Result<[Match]?, NetworkErrorCase>?) -> Void) {
            matchListTask.perform(matchListRequest) { (result) in
                completion(result)
            }
        }
    }
}
