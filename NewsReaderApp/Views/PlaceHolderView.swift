//
//  PlaceHolderView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import SwiftUI

struct PlaceholderView: View {
    
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.large)
                    .font(.system(size: 50))
            }
            Text(text)
            Spacer()
        }
    }
    
}
