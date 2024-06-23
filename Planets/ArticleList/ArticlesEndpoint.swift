//
//  ArticlesEndpoint.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

enum ArticlesEndpoint {
    case recentArticles(fromDate: String, toDate: String)
}

extension ArticlesEndpoint: Endpoint
{
    var path: String {
        switch self {
        case .recentArticles:
            return "/planetary/apod"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .recentArticles:
            return .get
        }
    }
        
    var headers: [HTTPHeader: String]? {
        switch self {
        case .recentArticles:
            var headers: [HTTPHeader: String]?
            headers?[.contentType] = ContentType.json.rawValue
            if !token.isEmpty {
                headers?[.authorization] = "Bearer \(token)"
            }
            return headers
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .recentArticles(let fromDate, let toDate):
            return [
                URLQueryItem(name: "api_key", value: Constants.apiKey),
                URLQueryItem(name: "start_date", value: fromDate),
                URLQueryItem(name: "end_date", value: toDate)
            ]
        }
    }
}
