//
//  NewsViewModel.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import Foundation

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}

@MainActor
class NewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty
    private let newsAPI: NewsAPIServiceProtocol
    @Published var category: Category
    
    init(articles: [Article]? = nil, 
         selectedCategory: Category = .business, 
         newsAPi: NewsAPIServiceProtocol = NewsAPISerVice()) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.category = selectedCategory
        self.newsAPI = newsAPi
    }
    
    func loadArticles() async {
        if Task.isCancelled { return }
        phase = .empty
        do {
            if Task.isCancelled { return }
            if let articles = try await newsAPI.fetch(from: category.text).articles {
                phase = .success(articles.filter {$0.title != "[Removed]"})
            }
        } catch {
            if Task.isCancelled { return }
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
}
