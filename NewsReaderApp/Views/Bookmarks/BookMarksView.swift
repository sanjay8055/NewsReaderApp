//
//  BookMarksView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import SwiftUI
import SwiftData

struct BookMarksView: View {
    
    @State var searchText: String = ""
    @EnvironmentObject var bookmarsViewModel: BookMarksViewModel
    
    var body: some View {
        NavigationView {
            NewsArticleListView(articles: articles)
                .overlay(overlayView(isEmpty: articles.isEmpty))
                .navigationTitle("BookMarked Articles")
        }
        .searchable(text: $searchText)
    }
    
    private var articles: [ArticleModel] {
        if !searchText.isEmpty {
           return bookmarsViewModel.search(searchText: searchText)
        } else {
            return bookmarsViewModel.bookmarks
        }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            PlaceholderView(text: "No saved articles", image: Image(systemName: "bookmark"))
        }
    }
}

//#Preview {
//    BookMarksView()
//}
