//
//  PostListItemView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct PostListItemView: View {
    let post: Post
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
                    
                    
                }
            }
        }
    }
}

//#Preview {
//    PostListItemView()
//}