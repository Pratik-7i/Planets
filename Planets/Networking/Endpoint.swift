//
//  Endpoint.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [HTTPHeader: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint
{
    /**
     All our environments (local, staging, and production) are `https`,
     so I assigned default value to scheme. If our `development` environment
     is still `http`, we can assign it later when we define endpoints.
    */
    
    var scheme: String {
        return "https"
    }

    var baseURL: String {
        return Constants.baseURL
    }
    
    /**
     For the sake of demo, we are not using `token`. If it is empty,
     it will not be set for `Authorization` header field.
     */
    
    var token: String {
        return ""
    }
    
    func urlRequest() throws -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseURL
        urlComponents.path = path
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key.rawValue)
            }
        }
        return request
    }
}
