//
//  PlayConfiguration.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct PlayConfiguration: Decodable {
    let home: PlayTeamInfo
    let away: PlayTeamInfo
    
    enum CodingKeys: String, CodingKey {
        case home = "home_team"
        case away = "away_team"
    }
}

struct PlayTeamInfo: Decodable {
    let name: String
    let logoURL: String
    let pitcherName: String
    let hitterName: String
    let plateAppearance: Int
    let totalHitCount: Int
    let isTurnToPitch: Bool
    
    enum CodingKeys: String, CodingKey {
        case name = "team_name"
        case logoURL = "logo_url"
        case pitcherName = "pitcher_name"
        case hitterName = "hitter_name"
        case plateAppearance = "plate_appearance"
        case totalHitCount = "total_hit_count"
        case isTurnToPitch = "is_turn_to_pitch"
    }
}
