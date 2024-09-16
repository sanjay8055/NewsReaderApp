//
//  BookMarksView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import SwiftUI

struct BookMarksView: View {
    
    @EnvironmentObject var articleBookmarkVM: NewsBookMarkViewModel
    @State var searchText: String = ""
    
    var body: some View {        
        NavigationView {
            NewsArticleListView(articles: articles)
                .overlay(overlayView(isEmpty: articles.isEmpty))
                .navigationTitle("BookMarked Articles")
        }
        .searchable(text: $searchText)
    }
    
    private var articles: [Article] {
        if searchText.isEmpty {
            return articleBookmarkVM.bookmarks
        }
        return articleBookmarkVM.bookmarks
            .filter {
                $0.title.lowercased().contains(searchText.lowercased()) ||
                ($0.description ?? "").lowercased().contains(searchText.lowercased())
            }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            PlaceholderView(text: "No saved articles", image: Image(systemName: "bookmark"))
        }
    }
}

#Preview {
    BookMarksView()
}
