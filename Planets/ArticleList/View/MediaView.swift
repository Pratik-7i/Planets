//
//  MediaView.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import SwiftUI

struct MediaView: View {
    let article: AstronomyArticle
    var body: some View {
        ZStack {
            SDAsyncImage(url: article.thumbUrl)
                .aspectRatio(16/10, contentMode: .fill)
                .padding(.bottom, 3)
            if article.contentType == .video {
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
        }
    }
}

