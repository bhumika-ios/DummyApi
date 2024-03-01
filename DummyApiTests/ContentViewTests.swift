//
//  ContentViewTests.swift
//  DummyApiTests
//
//  Created by Bhumika Patel on 01/03/24.
//

import XCTest
import SwiftUI
@testable import DummyApi

final class ContentViewTests: XCTestCase {
    
    func testContentView() {
        let viewModel = PostViewModel()
        let contentView = ContentView()
            .environmentObject(viewModel)
        
        let hostingController = UIHostingController(rootView: contentView)
        
        let view = hostingController.view
        XCTAssertNotNil(view)
        
        viewModel.fetchPosts()
        
        let expectation = XCTestExpectation(description: "Posts fetched")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(viewModel.posts.count, 10)
        
    }
    
}
