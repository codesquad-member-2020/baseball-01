//
//  SelectTeamUseCase.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct SelectTeamUseCase {
    struct SelectTeamRequest: Request {
        var path: String
        var httpMethod: HTTPMethod = .patch
    }
    
    struct SelectTeamTask: NetworkTask {
        typealias Output = Result<SelectingStatus, NetworkErrorCase>
        
        private let networkDispatcher: NetworkDispatcher
        
        init(networkDispatcher: NetworkDispatcher) {
            self.networkDispatcher = networkDispatcher
        }
        
        func perform(_ request: Request, completion: @escaping (Result<SelectingStatus, NetworkErrorCase>) -> Void) {
            networkDispatcher.execute(request: request) { (result) in
                switch result {
                case .success(let data):
                    guard let selectingStatus = try? JSONDecoder().decode(SelectingStatus.self, from: data) else { return }
                    completion(.success(selectingStatus))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func requestSelectTeam(matchIdentifier: Int,
                                  teamIdentifier: Int,
                                  with selectTeamTask: SelectTeamTask,
                                  completion: @escaping (Result<SelectingStatus, NetworkErrorCase>) -> Void) {
        let selectTeamRequest = SelectTeamRequest(path: "http://52.79.100.252:8080/matches/\(matchIdentifier)/teams/\(teamIdentifier)")
        selectTeamTask.perform(selectTeamRequest) { (result) in
            completion(result)
        }
    }
}
