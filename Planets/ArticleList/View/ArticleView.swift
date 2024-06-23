//
//  ArticleView.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import SwiftUI

struct ArticleView: View {
    
    let article: AstronomyArticle
    
    var body: some View {
        VStack(spacing: 0) {
            MediaView(article: article)
            VStack(spacing: 8) {
                VStack(spacing: 6) {
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
                HStack {
                    if let copyright = article.copyright?.trimmed {
                        CopyrightView(copyrightOf: copyright)
                    }
                    Spacer()
                    Text(article.publishDate)
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 3)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
        }
        .background(.cardBackground)
        .cornerRadius(8)
        .padding(.bottom, 8)
    }
}

struct CopyrightView: View {
    let copyrightOf: String
    var body: some View {
        HStack(spacing: 0) {
            Text("Copyright • ")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.copyrightLabel)
            Text(copyrightOf)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.copyrightLabel)
        }
    }
}
