//
//  MockLoginService.swift
//  InspectionAssignmentTests
//
//  Created by Sanjay Raskar on 22/07/24.
//

import Foundation

class MockNewsAPISerVice: NewsAPIServiceProtocol {
    var result = false
    
    func fetch(from category: String) async throws -> NewsResponse {
        
        if result {
            if let bundleUrl = Bundle.main.url(forResource: "newsResponse", withExtension: "json"),
               let data = try? Data(contentsOf: bundleUrl) {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                let response = try? jsonDecoder.decode(NewsResponse.self, from: data)
                return response ?? NewsResponse(status: "ok", totalResult: 10, articles: [], message: "")
            }
        }
        
        return try JSONDecoder().decode(NewsResponse.self, from: "test".data(using: .utf8)!)
        
    }
    
}
