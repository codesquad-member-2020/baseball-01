//
//  SelectingStatus.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/15.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct SelectingStatus: Decodable {
    let statusCode: Int
    let message: String
    let team: SelectedTeam?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case message
        case team = "data"
    }
}
