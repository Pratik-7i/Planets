//
//  NetworkError.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noResponse
    case decode
    case unauthorized
    case notFound
    case unexpectedCode
    case unknown
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noResponse:
            return "No response found"
        case .decode:
            return "Data decoding error"
        case .unauthorized:
            return "Session expired"
        case .notFound:
            return "The server cannot find the requested resource"
        case .unexpectedCode:
            return "Unexpected Status code"
        case .unknown:
            return "Unknown error occurred"
        }
    }
}
