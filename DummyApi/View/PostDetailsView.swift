//
//  PostDetailsView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct PostDetailsView: View {
    let post: Post
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    // Image
                    UrlImage(url: post.image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360,height: 250)
                        .clipped()
                    
                    // Post details
                    VStack(alignment: .leading){
                        HStack{
                            Text(post.text)
                                .font(.system(size: 24))
                                .bold()
                                
                            Spacer()
                        }
                        HStack {
                            Text("\(post.likes) likes")
                            Spacer()
                            // Text("Comments: \(/* Implement comments count */post.)")
                        }
                        Divider()
                        Text(post.text)
                            .font(.title3)
                        Spacer()
                        Text("Posted on: \(post.publishDate)")
                        
                        Text("Owner: \(post.owner.firstName) \(post.owner.lastName)")
                        
                         
                        
                        // Additional details can be added here
                        
                    }
                   // .padding(.horizontal)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
                          
    }
}

//#Preview {
//    PostDetailsView()
//}
