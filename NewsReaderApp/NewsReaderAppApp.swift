//
//  NewsReaderAppApp.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 12/09/24.
//

import SwiftUI
import SwiftData

@main
struct NewsReaderAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ArticleModel.self])
        }
    }
}
