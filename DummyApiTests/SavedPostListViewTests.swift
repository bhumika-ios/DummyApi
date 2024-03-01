//
//  SavedPostListViewTests.swift
//  DummyApiTests
//
//  Created by Bhumika Patel on 01/03/24.
//

import XCTest
@testable import DummyApi
import SwiftUI

final class SavedPostListViewTests: XCTestCase {

    func testSavedPostListView() {
        
        let viewModel = PostViewModel()
        viewModel.savedPostIDs = Set(["60d21b4667d0d8992e610c85", "60d21b4967d0d8992e610c90"]) 
        
        let savedPosts: [Post] = [
            Post(id: "60d21b4667d0d8992e610c85", image: "https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg", likes: 43, tags: ["animal","dog","golden retriever"], text: "adult Labrador retriever", publishDate: "2020-05-24T14:53:17.598Z", owner: Owner(id: "60d0fe4f5311236168a109ca", title: "ms", firstName: "Sara", lastName: "Andersen", picture: "https://randomuser.me/api/portraits/women/58.jpg")),
            
            Post(id: "60d21b4967d0d8992e610c90", image: "https://img.dummyapi.io/photo-1510414696678-2415ad8474aa.jpg", likes: 31, tags: ["snow","ice","mountain"], text: "ice caves in the wild landscape photo of ice near ...", publishDate: "2020-05-24T07:44:17.738Z", owner: Owner(id: "60d0fe4f5311236168a10a0b", title: "miss", firstName: "Margarita", lastName: "Vicente", picture: "https://randomuser.me/api/portraits/med/women/5.jpg")),
                ]
        _ = SavedPostListView(savedPosts: .constant(savedPosts), viewModel: viewModel)
    }
}
