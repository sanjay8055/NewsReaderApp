//
//  NewsAPISerVice.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import Foundation

protocol NewsAPIServiceProtocol {
    func fetch(from category: String) async throws -> NewsResponse
}

struct NewsAPISerVice: NewsAPIServiceProtocol {
    
    private let networkManager: NetworkManaging
  
    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetch(from category: String) async throws -> NewsResponse {
        try await networkManager.fetchData(from:  UrlPath.generateNewsURL(from: category))
    }
}
