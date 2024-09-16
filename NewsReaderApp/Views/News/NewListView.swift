//
//  ArticlesView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import SwiftUI

struct NewListView: View {
    
    @StateObject var articleNewsViewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            NewsArticleListView(articles: articles)
                .overlay(overlayView)
                .refreshable {
                    refreshTask()
                }
                .task(id: articleNewsViewModel.category, {
                   await loadTask()
                })
                .navigationTitle("\(articleNewsViewModel.category.text) News")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        categoryButton
                    }
                }
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsViewModel.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty:
            PlaceholderView(text: "No Articles", image: nil)
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: refreshTask)
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsViewModel.phase {
            return articles
        } else {
            return []
        }
    }
    
    private func loadTask() async {
        await articleNewsViewModel.loadArticles()
    }
    
    private func refreshTask() {
        Task {
            await loadTask()
        }
    }
    
    private var categoryButton: some View {
        Menu {
            Picker("Category", selection: $articleNewsViewModel.category) {
                ForEach(Category.allCases) {
                    Text($0.text)
                        .tag($0)
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .imageScale(.large)
        }
    }
}

#Preview {
    NewListView()
}
