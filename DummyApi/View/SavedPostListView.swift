//
//  SavedPostListView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct SavedPostListView: View {
    @Binding var savedPosts: [Post]
       @ObservedObject var viewModel: PostViewModel
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(savedPosts.filter { viewModel.isPostSaved(post: $0) }) { post in
                            
                        }
                    }
                    .padding()
                }
    }
}

//#Preview {
//    SavedPostListView()
//}