//
//  ArticleModel.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 16/09/24.
//

import Foundation
import SwiftData

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

@Model
class ArticleModel: Codable {
    let source: Source
    let author: String?
    let urlToImage: String?
    @Attribute(.unique) let url: String
    let publishedAt: Date
    let title: String
    let descriptions: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case url
        case publishedAt
        case author
        case description
        case urlToImage
    }
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(Source.self, forKey: .source)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.url = try container.decode(String.self, forKey: .url)
        self.publishedAt = try container.decode(Date.self, forKey: .publishedAt)
        self.title = try container.decode(String.self, forKey: .title)
        self.descriptions = try container.decodeIfPresent(String.self, forKey: .description)
    }
    
    func encode(to encoder: any Encoder) throws {
        //implement if required
    }
    
    var captionText: String {
        "\(source.name) ‧ \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
    
    var imageUrl: URL? {
        if let urlToImage, let url = URL(string: urlToImage) {
            return url
        }
        return nil
    }
    
    var newsUrl: URL {
        if let fullNewsUrl = URL(string: url) {
            return fullNewsUrl
        }
        return URL(string: "https://newsapi.org")!
    }
    
    var id: String {
        url
    }
}
