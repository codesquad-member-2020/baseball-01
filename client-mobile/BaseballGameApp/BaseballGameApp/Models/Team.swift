//
//  Team.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct Team: Decodable {
    let identifier: Int
    let name: String
    let logoImage: String
    let isOccupied: Bool
    
    enum CodingKeys: String, CodingKey {
        case identifier = "team_id"
        case name = "team_name"
        case logoImage = "logo_image"
        case isOccupied = "user_status"
    }
}
