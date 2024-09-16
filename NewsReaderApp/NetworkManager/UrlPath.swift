//
//  UrlPath.swift
//  InspectionAssignment
//
//  Created by Sanjay Raskar on 20/07/24.
//

import Foundation

struct UrlPath {
    
    static private let apiKey = "bc980d6ed9a946d9aa7862978a6d6c2d"
    static private let baseUrl = "https://newsapi.org/v2/top-headlines?"
    static private let language = "&language=en"

    static func generateNewsURL(from category: String) -> String {
        var url = baseUrl
        url += "apiKey=\(apiKey)"
        url += language
        url += "&category=\(category)"
        return url
    }
}
