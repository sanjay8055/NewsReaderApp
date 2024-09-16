//
//  Category.swift
//  NewsReaderApp
//
//  Created by Sanjay Raskar on 15/09/24.
//

import Foundation

enum Category: String, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case sports
    case science
    case technology
    
    var text: String {
        rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
