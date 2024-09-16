//
//  ContentView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 12/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewListView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            BookMarksView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
