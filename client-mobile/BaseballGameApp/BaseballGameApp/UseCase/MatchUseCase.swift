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
    
    
}
