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
            Text("Error: \(viewModel.networkError?.localizedDescription)")
            LazyVStack(spacing: 12) {
                ForEach(viewModel.articles) { article in
                    Text("\(article.title)")
                }
            }
        }
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
