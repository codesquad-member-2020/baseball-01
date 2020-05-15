//
//  SelectedTeam.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct SelectedTeam: Decodable {
    let userStatus: Bool
    let name: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case userStatus = "user_status"
        case name = "team_name"
        case type = "team_type"
    }
}
