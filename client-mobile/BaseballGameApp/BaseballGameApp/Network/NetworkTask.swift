//
//  NetworkTask.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

protocol NetworkTask {
    associatedtype Output
    
    func perform(_ request: Request, completion: @escaping (Output?) -> Void)
}
