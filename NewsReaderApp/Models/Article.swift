//
//  Article.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 12/09/24.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article: Codable {
    let source: Source
    let author: String?
    let urlToImage: String?
    let url: String
    let publishedAt: Date
    let title: String
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case url
        case publishedAt
        case author
        case description
        case urlToImage
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

extension Article: Equatable { }

extension Article: Identifiable { }

extension Article {
    static let mockresponseFile = "newsResponse"
    static var previewData: [ArticleModel] {
        if let bundleUrl = Bundle.main.url(forResource: mockresponseFile, withExtension: "json"),
           let data = try? Data(contentsOf: bundleUrl) {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let response = try? jsonDecoder.decode(NewsResponse.self, from: data)
            return response?.articles ?? []
        }
        return []
    }
}

struct Source: Codable {
    let name: String
}
extension Source: Equatable { }
