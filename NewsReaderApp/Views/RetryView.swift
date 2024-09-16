//
//  RetryView.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 14/09/24.
//

import SwiftUI

struct RetryView: View {

    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 6) {
            Text(text)
                .font(.body)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try again")
            }
        }
    }
}
