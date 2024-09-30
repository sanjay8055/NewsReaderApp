//
//  BookMarksViewModel.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 16/09/24.
//

import Foundation
import SwiftData

class NewsDataStore {
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func isBookmarked(for article: ArticleModel) -> Bool {
        let descriptor = FetchDescriptor<ArticleModel>(predicate: #Predicate { data in
            data.id == article.id
        })
        do {
            return try modelContext.fetch(descriptor).isEmpty
        } catch {
            print("Failed to load Article model")
        }
        return false
    }
    
    func addBookmark(for article: ArticleModel) {
        guard !isBookmarked(for: article) else {
            return
        }
        modelContext.insert(article)
    }
    
    func load() -> [ArticleModel] {
        let descriptor = FetchDescriptor<ArticleModel>()
        do {
            return try modelContext.fetch(descriptor)
        } catch {
            print("Failed to load Article model")
        }
        return []
    }
    
    func removeBookmark(for article: ArticleModel) {
        modelContext.delete(article)
    }
}
