//
//  NewsDetailView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import SwiftUI

struct NewsDetailView: View {
    let article: ArticleModel

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: article.imageUrl) { phase in
                    switch phase {
                    case .empty:
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    case .failure:
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                                .imageScale(.large)
                            Spacer()
                        }
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(minHeight: 250, maxHeight: 350)
                .clipped()
                VStack(alignment: .leading, spacing: 8) {
                    if let author = article.author {
                        Text("By \(author)")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    Text("Updated \(article.publishedAt)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    Text(article.title)
                        .font(.headline)
                    
                    if let description = article.descriptions {
                        Text(description)
                            .font(.subheadline)
                    }
                    Link("Read full news", destination: article.newsUrl)
                        .font(.body)
                        .foregroundStyle(.blue)
                    Spacer()
                }
                
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .handleOpenURLInApp()
        }
    }
}

//#Preview {
//    if let article = Article.previewData.first {
//        NewsDetailView(article: article)
//    } else {
//        EmptyView()
//    }
//}
