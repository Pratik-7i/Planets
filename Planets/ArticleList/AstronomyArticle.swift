//
//  AstronomyArticle.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

enum MediaType {
    case image
    case video
}

struct AstronomyArticle: Identifiable {
    var id = UUID()
    let title: String
    let explanation: String
    let mediaType: String
    let mediaUrl: String
    let mediaHdUrl: String?
    let dateString: String
    let copyright: String?
}

extension AstronomyArticle: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case explanation
        case mediaType = "media_type"
        case mediaUrl = "url"
        case mediaHdUrl = "hdurl"
        case dateString = "date"
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        explanation = try container.decode(String.self, forKey: .explanation)
        mediaType = try container.decode(String.self, forKey: .mediaType)
        mediaUrl = try container.decode(String.self, forKey: .mediaUrl)
        mediaHdUrl = try container.decodeIfPresent(String.self, forKey: .mediaHdUrl)
        dateString = try container.decode(String.self, forKey: .dateString)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
    }
}

extension AstronomyArticle {
    var publishDate: String {
        guard let date = dateString.toDate(format: Constants.apiDateFormat) else { return "" }
        return date.timeAgo
    }
    var contentType: MediaType {
        return self.mediaType == "video" ? .video : .image
    }
    var thumbUrl: String {
        if contentType == .video {
            guard let url = mediaUrl.split(separator: "?").first else { return "" }
            let videoId = (url as NSString).lastPathComponent
            let youtubeThumbURL = "https://i.ytimg.com/vi/\(videoId)/hqdefault.jpg"
            return youtubeThumbURL
        } else {
            return mediaUrl
        }
    }
}
