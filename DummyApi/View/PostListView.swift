//
//  PostListView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct PostListView: View {
    let posts: [Post]
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(posts) { post in
                        NavigationLink(destination: PostDetailsView(post: post)) {
                            PostListItemView(post: post)
                        }
                    }
                }
                .padding()
            }
        }
    }
}


//#Preview {
//    PostListView()
//}
