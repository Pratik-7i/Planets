//
//  Constants.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

struct Constants {
    static let baseURL = BaseURL.development
    static let apiKey = "DEMO_KEY"
}

/**
 For the sake of demo, all the URLs are kept same
 */

struct BaseURL {
    static let development = "api.nasa.gov"
    static let staging = "api.nasa.gov"
    static let production = "api.nasa.gov"
}
