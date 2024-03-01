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
        NavigationView {
            ZStack {
                VStack{
                    if !viewModel.isInternetConnected {
                        VStack{
                            Text("No internet connection")
                                .font(.title)
                               
                            Image(systemName: "wifi.slash")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .foregroundColor(.red)
                    } else {
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
                    }
                }
                
                .onAppear {
                                   viewModel.fetchPosts()
                               }
                               
                               
            }
            
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.white)
                        Text("iOS Developer")
                            .font(.system(size: 18, weight: .bold))  // Set the font and weight
                            .foregroundColor(Color.white)  // Set the text color
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                }
            }
            .toolbarBackground(Color("blue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
