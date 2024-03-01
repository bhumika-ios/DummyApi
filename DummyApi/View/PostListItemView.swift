//
//  PostListItemView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct PostListItemView: View {
    let post: Post
    @ObservedObject var viewModel: PostViewModel
    @State private var isSaved: Bool = false
    @State private var showToast: Bool = false
     @State private var toastMessage: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            // Image
            HStack{
                UrlImage(url: post.image)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding()
                // Post details
                VStack(alignment: .leading){
                    HStack{
                        Text(post.text)
                            .font(.headline)
                    }
                    
                    Text("Likes: \(post.likes)")
                    
                    Text("Posted on: \(post.publishDate)")
                    
                    Text("Owner: \(post.owner.firstName)")
                    
                }
                Button(action: {
                                    viewModel.toggleSave(post: post)
                                    showToast = true
                                    toastMessage = viewModel.isPostSaved(post: post) ? "saved" : "Unsaved"
                                }) {
                                    Image(systemName: viewModel.isPostSaved(post: post) ? "bookmark.fill" : "bookmark")
                                        .foregroundColor(viewModel.isPostSaved(post: post) ? .blue : .gray)
                                        .padding()
                                }
                                .offset(y: -50)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .toast(isPresented: $showToast, message: toastMessage)
    }
}

//#Preview {
//    PostListItemView()
//}
