//
//  HTTPClient.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

protocol HTTPProtocol {
    func asyncRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T
}

final class HTTPClient: HTTPProtocol
{
    var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        //configuration.timeoutIntervalForResource = 300
        return URLSession(configuration: configuration)
    }
    
    func asyncRequest<T: Decodable>(
        endpoint: any Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        do {
            let (data, response) = try await session.data(for: endpoint.urlRequest())
            return try self.manageResponse(data: data, response: response)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw error
        }
    }
    
    private func manageResponse<T: Decodable>(
        data: Data,
        response: URLResponse
    ) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.noResponse
        }
        switch response.statusCode
        {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decode
            }
        case 401:
            throw NetworkError.unauthorized
        case 404:
            throw NetworkError.notFound
        default:
            throw NetworkError.unexpectedCode
        }
    }
}
