//
//  ViewDidLoadModifier.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

import Foundation
import SwiftUI

typealias Action = (() -> Void)

struct ViewDidLoadModifier: ViewModifier {

    @State private var didLoad = false
    private let action: Action?

    init(perform action: Action? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }
}

extension View {
    func onLoad(perform action: Action? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
