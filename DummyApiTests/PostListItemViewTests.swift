//
//  PostListItemViewTests.swift
//  DummyApiTests
//
//  Created by Bhumika Patel on 01/03/24.
//

import XCTest
@testable import DummyApi
import SwiftUI

final class PostListItemViewTests: XCTestCase {

    func testPostListItemView() {
        let viewModel = PostViewModel()
        let post = Post(id: "60d21b4667d0d8992e610c85", image: "https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg", likes: 43, tags: ["animal","dog","golden retriever"], text: "adult Labrador retriever", publishDate: "2020-05-24T14:53:17.598Z", owner: Owner(id: "60d0fe4f5311236168a109ca", title: "ms", firstName: "Sara", lastName: "Andersen", picture: "https://randomuser.me/api/portraits/women/58.jpg"))
        
        let postListView = PostListItemView(post: post, viewModel: viewModel)

        
        let hostingController = UIHostingController(rootView: postListView)
        let view = hostingController.view
        XCTAssertNotNil(view)

    }

}
