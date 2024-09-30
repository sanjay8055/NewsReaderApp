//
//  BookMarksViewModel.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 16/09/24.
//

import Foundation
import SwiftData

class BookMarksViewModel: ObservableObject {
    
    let modelContext: ModelContext
    @Published private(set) var bookmarks: [ArticleModel] = []

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        load()
    }
    
    func isBookmarked(for article: ArticleModel) -> Bool {
        let descriptor = FetchDescriptor<ArticleModel>(predicate: #Predicate { data in
            data.url == article.url
        })
        do {
            return try !modelContext.fetch(descriptor).isEmpty
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
        saveContext()
    }
    
    func load() {
        let descriptor = FetchDescriptor<ArticleModel>()
        do {
            bookmarks = try modelContext.fetch(descriptor)
        } catch {
            print("Failed to load Article model")
        }
    }
    
    
    func search(searchText: String) -> [ArticleModel] {
        let fetchDescriptor = FetchDescriptor<ArticleModel>(predicate: #Predicate { $0.title.contains(searchText) }, sortBy: [SortDescriptor(\.title)])
        do {
             return try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to load Article model")
        }
        return []
    }
    
    func removeBookmark(for article: ArticleModel) {
        modelContext.delete(article)
        saveContext()
    }
    
    func saveContext() {
        try? modelContext.save()
        load()
    }
}
