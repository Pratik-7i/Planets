//
//  ArticlesViewModel.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

final class ArticlesViewModel: ObservableObject {

    @Published var articles: [AstronomyArticle] = []
    @Published var state: ArticleListState?

    let httpClient: HTTPProtocol

    init(httpClient: HTTPProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    var fromDate: String {
        let date = Date().changeDays(
            by: -Constants.lastDaysCount
        )
        return date.readable(format: Constants.apiDateFormat)
    }
    
    var today: String {
        Date().readable(format: Constants.apiDateFormat)
    }
    
    @MainActor
    func fetchArticles() async {
        self.state = .loading
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
            self.state = .success
        } catch let error as NetworkError {
            self.state = .error(message: error.localizedDescription)
        } catch {
            self.state = .error(message: error.localizedDescription)
        }
    }
}
