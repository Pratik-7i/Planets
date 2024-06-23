//
//  ErrorView.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import SwiftUI

typealias retryTapHandler = (() -> Void)

struct ErrorView: View {
    
    var message: String = ""
    var onRetryTap: retryTapHandler?
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                VStack(spacing: 5) {
                    Image(systemName: "icloud.slash")
                        .font(.system(size: 60))
                        .foregroundColor(Color(.secondaryLabel))
                    Text("\(message)")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                }
                Button {
                    onRetryTap?()
                } label: {
                    Text("Retry")
                        .font(.system(size: 18, weight: .medium))
                }
                .frame(width: 120, height: 38)
                .background(.blue)
                .foregroundColor(Color(.systemBackground))
                .cornerRadius(5)
            }
            .padding(20)
            .cornerRadius(8)
        }
    }
}

#Preview {
    ErrorView(
        message: "Open your Polarbackup desktop software → Settings → Connection → If the Wireless connection (WiFi) option is selected, click on WiFi Safelist, and make sure the All WiFi networks option is selected → Click the Save icon → Click the Save icon.",
        onRetryTap: {
            print("Retry tapped!")
    })
}
