//
//  MockEndpoint.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation
@testable import Planets

struct MockEndpoint: Endpoint {
    var scheme: String = "https"
    var baseURL: String = "example.com"
    var path: String = "/test"
    var method: HTTPMethod = .get
    var headers: [HTTPHeader: String]? = nil
    var queryItems: [URLQueryItem]? = nil
}

struct MockEndpoint2: Endpoint {
    var scheme: String = "https"
    var baseURL: String = "example"
    var path: String = "/test"
    var method: HTTPMethod = .get
    var headers: [HTTPHeader: String]? = nil
    var queryItems: [URLQueryItem]? = nil
}
