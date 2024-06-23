//
//  HTTPClientTest.swift
//  PlanetsTests
//
//  Created by Pratik on 23/06/24.
//

import XCTest
@testable import Planets

struct TestModel: Codable {
    let id: Int
    let title: String
}

final class HTTPClientTests: XCTestCase {
    
    var session: URLSession?
    
    override func setUp() {
        super.setUp()
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        self.session = URLSession(configuration: sessionConfiguration)
    }
    
    private func setMockProtocolValidData() {
        MockURLProtocol.requestHandler = { request in
            let exampleData =
                """
                {
                "id": 1,
                "title": "Andromeda Galaxy"
                }
                """
                .data(using: .utf8)!
            let response = HTTPURLResponse.init(
                url: request.url!,
                statusCode: 200,
                httpVersion: "2.0",
                headerFields: nil)!
            return (response, exampleData)
        }
    }
    
    private func setMockProtocolInvalidData() {
        MockURLProtocol.requestHandler = { request in
            let exampleData =
                """
                {
                "id": 1,
                "title":
                }
                """
                .data(using: .utf8)!
            let response = HTTPURLResponse.init(
                url: request.url!,
                statusCode: 200,
                httpVersion: "2.0",
                headerFields: nil)!
            return (response, exampleData)
        }
    }
    
    private func setMockProtocolUnauthorizedStatsCode() {
        MockURLProtocol.requestHandler = { request in
            let exampleData =
                """
                """
                .data(using: .utf8)!
            let response = HTTPURLResponse.init(
                url: request.url!,
                statusCode: 401,
                httpVersion: "2.0",
                headerFields: nil)!
            return (response, exampleData)
        }
    }
    
    private func setMockProtocolNotFoundStatsCode() {
        MockURLProtocol.requestHandler = { request in
            let exampleData =
                """
                """
                .data(using: .utf8)!
            let response = HTTPURLResponse.init(
                url: request.url!,
                statusCode: 404,
                httpVersion: "2.0",
                headerFields: nil)!
            return (response, exampleData)
        }
    }
    
    private func setMockProtocolUnexpectedStatsCode() {
        MockURLProtocol.requestHandler = { request in
            let exampleData =
                """
                """
                .data(using: .utf8)!
            let response = HTTPURLResponse.init(
                url: request.url!,
                statusCode: 500,
                httpVersion: "2.0",
                headerFields: nil)!
            return (response, exampleData)
        }
    }
    
    func testAsyncRequest_success() async throws {
        setMockProtocolValidData()
        let apiClient = HTTPClient(session: self.session!)
        let endpoint = MockEndpoint()
        do {
            let result = try await apiClient.asyncRequest(
                endpoint: endpoint,
                responseModel: TestModel.self
            )
            XCTAssertEqual(result.id, 1)
            XCTAssertEqual(result.title, "Andromeda Galaxy")
        } catch {
            print(error)
            throw error
        }
    }
    
    func testAsyncRequest_decodeError() async throws {
        setMockProtocolInvalidData()
        let apiClient = HTTPClient(session: self.session!)
        let endpoint = MockEndpoint()
        do {
            _ = try await apiClient.asyncRequest(
                endpoint: endpoint,
                responseModel: TestModel.self
            )
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.decode)
        }
    }
    
    func testAsyncRequest_unauthorizedError() async throws {
        setMockProtocolUnauthorizedStatsCode()
        let apiClient = HTTPClient(session: self.session!)
        let endpoint = MockEndpoint()
        do {
            _ = try await apiClient.asyncRequest(
                endpoint: endpoint,
                responseModel: TestModel.self
            )
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.unauthorized)
        }
    }
    
    func testAsyncRequest_notFoundError() async throws {
        setMockProtocolNotFoundStatsCode()
        let apiClient = HTTPClient(session: self.session!)
        let endpoint = MockEndpoint()
        do {
            _ = try await apiClient.asyncRequest(
                endpoint: endpoint,
                responseModel: TestModel.self
            )
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.notFound)
        }
    }
    
    func testAsyncRequest_unexpectedError() async throws {
        setMockProtocolUnexpectedStatsCode()
        let apiClient = HTTPClient(session: self.session!)
        let endpoint = MockEndpoint()
        do {
            _ = try await apiClient.asyncRequest(
                endpoint: endpoint,
                responseModel: TestModel.self
            )
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.unexpectedCode)
        }
    }
    
    func testAsyncRequest_invalidUrlError() async throws {
        let apiClient = HTTPClient(session: self.session!)
        let endpoint = MockEndpoint2()
        do {
            _ = try await apiClient.asyncRequest(
                endpoint: endpoint,
                responseModel: TestModel.self
            )
        } catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.unexpectedCode)
        }
    }
}
