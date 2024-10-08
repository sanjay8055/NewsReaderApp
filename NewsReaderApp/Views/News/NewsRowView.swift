//
//  ArticleRowView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 12/09/24.
//

import SwiftUI

struct NewsRowView: View {
    
    let article: Article
    @EnvironmentObject var newsBookmarkViewModel: NewsBookMarkViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(article.title)
                .font(.headline)
                .lineLimit(2)
            
            if let description = article.description {
                Text(description)
                    .font(.subheadline)
                    .lineLimit(3)
            }
            
            HStack {
                Text(article.captionText)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                    .font(.caption)
                
                Spacer()
                
                bookMarkButton
            }
            
        }
        .padding([.horizontal, .bottom])

    }
    
    private var bookMarkButton: some View {
        Button {
            toggleBookmark(for: article)
        } label: {
            Image(systemName: newsBookmarkViewModel.isBookmarked(for: article) ? "bookmark.fill" : "bookmark")
        }
        .buttonStyle(.bordered)
    }
    
    private func toggleBookmark(for article: Article) {
        if newsBookmarkViewModel.isBookmarked(for: article) {
            newsBookmarkViewModel.removeBookmark(for: article)
        } else {
            newsBookmarkViewModel.addBookmark(for: article)
        }
    }
}


#Preview {
    NewsRowView(article: Article.previewData[0])
}
