//
//  MatchList.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct MatchList: Decodable {
    let statusCode: Int
    let data: [Match]
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case data
    }
}
