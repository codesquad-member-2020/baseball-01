//
//  PlayConfigurationUseCase.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct PlayConfigurationUseCase {
    struct PlayConfigurationRequest: Request {
        var path: String
    }
    
    struct PlayConfigurationTask: NetworkTask {
        typealias Output = Result<PlayConfiguration, NetworkErrorCase>
        
        private let networkDispatcher: NetworkDispatcher
        
        init(networkDispatcher: NetworkDispatcher) {
            self.networkDispatcher = networkDispatcher
        }
        
        func perform(_ request: Request, completion: @escaping (Result<PlayConfiguration, NetworkErrorCase>) -> Void) {
            networkDispatcher.execute(request: request) { (result) in
                switch result {
                case .success(let data):
                    guard let playConfiguration = try? JSONDecoder().decode(PlayConfiguration.self, from: data) else { return }
                    completion(.success(playConfiguration))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func requestInitialData(matchIdentifier: Int,
                                   with playConfigurationTask: PlayConfigurationTask,
                                   completion: @escaping (Result<PlayConfiguration, NetworkErrorCase>) -> Void) {
        let playConfigurationRequest = PlayConfigurationRequest(path: "http://52.6.242.151:8080/matches/\(matchIdentifier)")
        playConfigurationTask.perform(playConfigurationRequest) { (result) in
            completion(result)
        }
    }
}
