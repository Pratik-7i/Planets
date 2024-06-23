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
    static let apiDateFormat = "yyyy-MM-dd"
    static let lastDaysCount = 7 // Today is included, so it will be 6+1 = 7 days
}

/**
 For the sake of demo, all the URLs are kept same
 */

struct BaseURL {
    static let development = "api.nasa.gov"
    static let staging = "api.nasa.gov"
    static let production = "api.nasa.gov"
}
