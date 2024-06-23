//
//  ArticlesViewModel.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

final class ArticlesViewModel: ObservableObject {

    let httpClient: HTTPProtocol

    init(httpClient: HTTPProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    @Published var articles: [AstronomyArticle] = []
    @Published var networkError: NetworkError?

    //@MainActor
    func getAsyncEvents() async {
        let endpoint = ArticlesEndpoint.recentArticles(
            fromDate: "2024-06-16",
            toDate: "2024-06-22"
        )
        do {
            let articles = try await httpClient.asyncRequest(
                endpoint: endpoint,
                responseModel: [AstronomyArticle].self
            )
            self.articles = articles
        } catch let error as NetworkError {
            self.networkError = error
        } catch {
            self.networkError = .unknown
        }
    }
}
