//
//  NewsReaderAppApp.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 12/09/24.
//

import SwiftUI

@main
struct NewsReaderAppApp: App {
    @StateObject var articleBookmarkVM = NewsBookMarkViewModel.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
