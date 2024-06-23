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
    
    var fromDate: String {
        Date().changeDays(
            by: -Constants.lastDaysCount
        ).readable(format: Constants.apiDateFormat)
    }
    
    var today: String {
        Date().readable(format: Constants.apiDateFormat)
    }
    
    @MainActor
    func fetchArticles() async {
        let endpoint = ArticlesEndpoint.recentArticles(
            fromDate: fromDate,
            toDate: today
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
