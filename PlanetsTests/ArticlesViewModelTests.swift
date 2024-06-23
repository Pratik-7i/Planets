//
//  ArticlesViewModelTests.swift
//  PlanetsTests
//
//  Created by Pratik on 23/06/24.
//

import XCTest
@testable import Planets

final class ArticlesViewModelTests: XCTestCase {

    var viewModel: ArticlesViewModel!

    override func setUpWithError() throws {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: sessionConfiguration)
        let httpClient = HTTPClient(session: session)
        viewModel = ArticlesViewModel(httpClient: httpClient)
    }

    private func setMockProtocolValidArticleListData() {
        MockURLProtocol.requestHandler = { request in
            let exampleData = try self.loadJSON(fileName: "MockArticleList")
            let response = HTTPURLResponse.init(
                url: request.url!,
                statusCode: 200,
                httpVersion: "2.0",
                headerFields: nil)!
            return (response, exampleData)
        }
    }
    
    private func setMockProtocolValidArticleInvalidData() {
        MockURLProtocol.requestHandler = { request in
            let exampleData = try self.loadJSON(fileName: "MockArticleInvalid")
            let response = HTTPURLResponse.init(
                url: request.url!,
                statusCode: 200,
                httpVersion: "2.0",
                headerFields: nil)!
            return (response, exampleData)
        }
    }
    
    func testFetchArticles_success() async throws {
        // Given
        setMockProtocolValidArticleListData()
        // When
        await viewModel.fetchArticles()
        // Then
        XCTAssertEqual(viewModel.articles.count, 7)
    }
    
    func testFetchArticles_error() async throws {
        // Given
        setMockProtocolValidArticleInvalidData()
        // When
        await viewModel.fetchArticles()
        // Then
        XCTAssertEqual(viewModel.state, .error(NetworkError.decode))
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
}
