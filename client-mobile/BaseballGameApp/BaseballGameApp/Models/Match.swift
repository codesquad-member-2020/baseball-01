//
//  Match.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct Match: Decodable {
    let identifier: Int
    let homeTeam: Team
    let awayTeam: Team
    
    enum CodingKeys: String, CodingKey {
        case identifier = "match_id"
        case homeTeam = "home"
        case awayTeam = "away"
    }
}
