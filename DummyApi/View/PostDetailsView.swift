//
//  PostDetailsView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct PostDetailsView: View {
    let post: Post
    @Environment(\.dismiss) private var dismiss
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
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    PostDetailsView()
//}
