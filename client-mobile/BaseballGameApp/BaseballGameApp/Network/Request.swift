//
//  Request.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

enum HTTPMethod: String, CustomStringConvertible {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
    case put = "PUT"
    
    var description: String {
        self.rawValue
    }
}

protocol Request {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpBody: Data? { get }
    var format: String? { get }
    var httpHeaderFields: [String]? { get }
    
    func urlRequest() -> URLRequest?
}

enum NetworkErrorCase: Error {
    case invalidURL
    case notFound
}

extension Request {
    var httpMethod: HTTPMethod { return .get }
    var httpBody: Data? { return nil }
    var format: String? { return "application/json" }
    var httpHeaderFields: [String]? { return ["Content-Type", "Accept"] }
    
    func urlRequest() -> URLRequest? {
        guard let url = URL(string: path) else { return nil }
        var urlRequest = URLRequest(url: url)
        httpHeaderFields!.forEach {
            urlRequest.addValue(format!, forHTTPHeaderField: $0)
        }
        urlRequest.httpMethod = httpMethod.description
        urlRequest.httpBody = httpBody
        return urlRequest
    }
}
