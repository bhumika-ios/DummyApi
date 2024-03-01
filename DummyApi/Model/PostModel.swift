//
//  PostModel.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: String
    let image: String
    let likes: Int
    let tags: [String]
    let text: String
    let publishDate: String
}
