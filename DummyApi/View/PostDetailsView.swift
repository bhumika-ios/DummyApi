//
//  PostDetailsView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct PostDetailsView: View {
    let post: Post
    var postText: String {
        return post.text
    }
    
    var likesText: String {
        return "\(post.likes) likes"
    }
    
    var publishedText: String {
        return "Posted on: \(post.publishDate)"
    }
    
    var ownerText: String {
        return "Owner: \(post.owner.firstName) \(post.owner.lastName)"
    }
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                   
                    UrlImage(url: post.image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360,height: 250)
                        .clipped()
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(post.text)
                                .font(.system(size: 20))
                                .bold()
                            
                            Spacer()
                        }
                        HStack {
                            Text("\(post.likes) likes")
                                .font(.system(size: 14))
                            Spacer()
                            
                        }
                        Divider()
                        Text(post.text)
                            .font(.system(size: 12))
                        Spacer()
                        Text("Posted on: \(post.formattedDate)")
                            .font(.system(size: 12))
                        
                        Text("Owner: \(post.owner.firstName) \(post.owner.lastName)")
                            .font(.system(size: 12))
                        
                    }
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.white)
                    }
                    
                    Text("Details")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                    
                    
                }
            }
            ToolbarItem(placement: .automatic) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.white)
            }
        }
        .toolbarBackground(Color("blue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    PostDetailsView()
//}
