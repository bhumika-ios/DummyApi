//
//  UrlImage.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct UrlImage: View {
    let url: String
    
    var body: some View {
        if let imageURL = URL(string: url), let imageData = try? Data(contentsOf: imageURL),
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(systemName: "photo")
                .resizable()
                
        }
    }
}
