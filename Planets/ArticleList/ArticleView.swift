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
        VStack {
            HStack {
                Text(article.title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color.primary)
                Spacer()
            }
            ZStack {
                SDAsyncImage(url: article.thumbUrl)
                    .aspectRatio(16/10, contentMode: .fill)
                    .cornerRadius(5)
                    .padding(.bottom, 3)
                if article.contentType == .video {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
            }
            HStack {
                Text(article.explanation)
                    .font(.system(size: 16))
                    .foregroundColor(.cardExplanationLabel)
                Spacer()
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
        .padding(12)
        .padding(.top, 3)
        .background(.cardBackground)
        .cornerRadius(8)
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
