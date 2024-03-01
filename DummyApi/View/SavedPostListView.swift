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
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if savedPosts.isEmpty || savedPosts.filter({ viewModel.isPostSaved(post: $0) }).isEmpty {
                                        Text("No saved posts.Please Save Posts...")
                                            .foregroundColor(.gray)
                                            
                                    } else {
                                        ForEach(savedPosts.filter { viewModel.isPostSaved(post: $0) }) { post in
                                            NavigationLink(destination: PostDetailsView(post: post)) {
                                                PostListItemView(post: post, viewModel: viewModel)
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }


//#Preview {
//    SavedPostListView()
//}
