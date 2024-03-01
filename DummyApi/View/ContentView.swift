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
