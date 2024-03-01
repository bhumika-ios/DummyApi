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
    let owner: Owner
 //   var isSaved: Bool = false

    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: publishDate) {
            dateFormatter.dateFormat = "E, hh:mm a"
            return dateFormatter.string(from: date)
        }
        return publishDate
    }
}
struct Owner: Codable {
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    let picture: String
}

struct PostResponse1: Codable {
    let data: [Post]
    let total: Int
    let page: Int
    let limit: Int
}
