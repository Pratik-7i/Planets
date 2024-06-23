//
//  RequestEnum.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

enum HTTPHeader: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
}

enum ContentType: String {
    case json = "application/json"
    case xml = "application/xml"
    case formUrlEncoded = "application/x-www-form-urlencoded"
}
