//
//  NewsVieModelTests.swift
//  NewsReaderAppTests
//
//  Created by Sanjay Raskar on 15/09/24.
//

import XCTest
@testable import NewsReaderApp

final class NewsVieModelTests: XCTestCase {

    private var newsViewModel: NewsViewModel!
    private let service = MockNewsAPISerVice()
    @MainActor override func setUpWithError() throws {
        newsViewModel = NewsViewModel(articles: Article.previewData, newsAPi: service)
    }

    override func tearDownWithError() throws {
       newsViewModel = nil
    }
    
    func testLoadArticlesSuccess() async {
        //Given
        service.result = true
        //When
       await newsViewModel.loadArticles()
        
        //Then
        switch await newsViewModel.phase {
        case .success(let articles):
            XCTAssertNotNil(articles)
        case .failure(let error):
            XCTAssertNil(error)
        case .empty:
           print("empty")
        }
    }
    
    func testLoadArticlesFailure() async {

        //When
       await newsViewModel.loadArticles()

        //Then
        switch await newsViewModel.phase {
        case .success(let articles):
            XCTAssertNil(articles)
        case .failure(let error):
            XCTAssertNotNil(error)
        case .empty:
           print("empty")
        }

    }

}
