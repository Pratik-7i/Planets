//
//  ArticleListView.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import SwiftUI

struct ArticleListView: View {
     
    @StateObject var viewModel = ArticlesViewModel()
              
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.articles) { article in
                        NavigationLink {
                            ArticleDetailView(article: article)
                        } label: {
                            ArticleView(article: article)
                        }
                    }
                }
            }
            .padding(10)
            .background(.screenBackground)          
            .navigationTitle("Recent Articles")
            .onLoad {
                Task {
                    await viewModel.fetchArticles()
                }
            }
            .overlay {
                if viewModel.state == .loading {
                    LoadingView()
                }
                if case let .error(error) = viewModel.state {
                    ErrorView(message: error.localizedDescription, onRetryTap: {
                        Task {
                            await viewModel.fetchArticles()
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ArticleListView()
}
