//
//  LoadingView.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack(spacing: 8) {
            ProgressView()
                .tint(.white)
            Text("Please wait...")
                .foregroundColor(.white)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(Color.loadingBackground)
        .cornerRadius(6)
    }
}

#Preview {
    LoadingView()
}
