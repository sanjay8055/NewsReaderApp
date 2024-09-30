//
//  NewsResponseModel.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 13/09/24.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResult: Int?
    let articles: [ArticleModel]?
    let message: String?
}
