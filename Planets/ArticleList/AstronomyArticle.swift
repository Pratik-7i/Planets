//
//  AstronomyArticle.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

struct AstronomyArticle: Identifiable {
    var id = UUID()
    let title: String
    let explanation: String
    let mediaType: String
    let mediaUrl: String
    let mediaHdUrl: String?
    let date: String
    let copyright: String?
}

extension AstronomyArticle: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case explanation
        case mediaType = "media_type"
        case mediaUrl = "url"
        case mediaHdUrl = "hdurl"
        case date
        case copyright
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        explanation = try container.decode(String.self, forKey: .explanation)
        mediaType = try container.decode(String.self, forKey: .mediaType)
        mediaUrl = try container.decode(String.self, forKey: .mediaUrl)
        mediaHdUrl = try container.decodeIfPresent(String.self, forKey: .mediaHdUrl)
        date = try container.decode(String.self, forKey: .date)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
    }
}
