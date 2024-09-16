//
//  NewsArticleListView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 15/09/24.
//

import SwiftUI

struct NewsArticleListView: View {
    
    let articles: [Article]
    
    var body: some View {
        List {
            ForEach(articles) { article in
                NewsRowView(article: article)
                    .background(
                        NavigationLink(article.title) {
                            NewsDetailView(article: article)
                        }.opacity(0)
                    )

              
                
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    NewsArticleListView(articles: Article.previewData)
}
