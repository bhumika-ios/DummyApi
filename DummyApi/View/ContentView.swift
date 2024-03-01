//
//  ContentView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                TabView {
                    PostListView(posts: viewModel.posts, viewModel: viewModel)
                    .tabItem {
                        Label("Feed", systemImage: "list.bullet")
                    }
                    SavedPostListView(savedPosts: $viewModel.posts, viewModel: viewModel)
                
                        .tabItem {
                            Label("Saved", systemImage: "bookmark")
                        }
                }
                .onAppear {
                    viewModel.fetchPosts()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
