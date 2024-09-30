//
//  ContentView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 12/09/24.
//

import SwiftUI

enum Screens: String {
    case News
    case Bookmarks
}

struct ContentView: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        TabView {
            NewListView()
                .tabItem {
                    Label(Screens.News.rawValue, systemImage: "newspaper")
                }

            BookMarksView()
                .tabItem {
                    Label(Screens.Bookmarks.rawValue, systemImage: "bookmark")
                }

        }
        .environmentObject(BookMarksViewModel(modelContext: context))

    }
}

#Preview {
    ContentView()
}
