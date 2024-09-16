//
//  BookMarkVieModelTests.swift
//  NewsReaderAppTests
//
//  Created by Sanjay Raskar on 16/09/24.
//

import XCTest
@testable import NewsReaderApp

final class BookMarkVieModelTests: XCTestCase {

   @MainActor
    func testaddBooKmarks() {
        //Given
       let bookamrks =  NewsBookMarkViewModel.shared
        let count = bookamrks.bookmarks.count + 1

        // when
        if let article = Article.previewData.first {
            bookamrks.addBookmark(for: article)
        }
        //then
        XCTAssert(bookamrks.bookmarks.count == count )

    }
    
    @MainActor
    func testRemoveBookmark() {
        let bookamrks = NewsBookMarkViewModel.shared
        let count = bookamrks.bookmarks.count - 1

        //when
        if let last = bookamrks.bookmarks.last {
            bookamrks.removeBookmark(for: last)
        }
        //then

        XCTAssert(bookamrks.bookmarks.count == count)

    }
    
}
