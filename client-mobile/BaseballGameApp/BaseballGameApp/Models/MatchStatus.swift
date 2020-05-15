//
//  MatchStatus.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct MatchStatus: Decodable {
    let statusCode: Int
    let data: PlayersStatus
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case data
    }
}

struct PlayersStatus: Decodable {
    let matchIdentifier: Int
    let home: TeamStatus
    let away: TeamStatus
    
    enum CodingKeys: String, CodingKey {
        case matchIdentifier = "match_id"
        case home, away
    }
}

struct TeamStatus: Decodable {
    let teamIdentifier: Int
    let name: String
    let isReady: Bool
    
    enum CodingKeys: String, CodingKey {
        case teamIdentifier = "team_id"
        case name = "team_name"
        case isReady = "user_status"
    }
}
