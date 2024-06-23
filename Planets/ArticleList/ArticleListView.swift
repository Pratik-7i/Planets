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
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.articles) { article in
                    ArticleView(article: article)
                }
            }
        }
        .padding(10)
        .background(.screenBackground)
        .onAppear {
            Task {
                await viewModel.getAsyncEvents()
            }
        }
    }
}

#Preview {
    ArticleListView()
}
