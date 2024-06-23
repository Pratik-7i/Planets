//
//  SDAsyncImage.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct SDAsyncImage: View {
    
    var roundCorner: CGFloat = 0
    var url: String
    
    var body: some View {
        GeometryReader { proxy in
            WebImage(url: URL(string: url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(width: proxy.size.width, height: proxy.size.height)
                .cornerRadius(roundCorner)
                .transition(.fade(duration: 0.65))
                .background(.imageBackground)
        }
    }
}

#Preview {
    SDAsyncImage(
        url: "https://apod.nasa.gov/apod/image/2406/SquidOu4_Linde_960.jpg"
    )
}

