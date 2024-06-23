//
//  ArticleListState.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

enum ArticleListState {
    case loading
    case success
    case error(_ error: Error)
}

extension ArticleListState: Equatable
{
    static func == (lhs: ArticleListState,
                    rhs: ArticleListState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case (.error(_), .error(_)):
            return true
        default:
            return false
        }
    }
}
