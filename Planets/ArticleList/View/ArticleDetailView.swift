//
//  ArticleDetailView.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let article: AstronomyArticle
    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                MediaView(article: article)
                    .cornerRadius(5)
                HStack {
                    Text(article.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.primary)
                    Spacer()
                }
                HStack {
                    Text(article.explanation)
                        .font(.system(size: 16))
                        .foregroundColor(.cardExplanationLabel)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
        }
        .padding(15)
    }
}
