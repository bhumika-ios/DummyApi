//
//  PostViewModel.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import Foundation
import Reachability


class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var savedPostIDs: Set<String> = []
    @Published var isLoading: Bool = false
    @Published var isInternetConnected = true

       private let reachability = try! Reachability()

       init() {
           setupReachability()
       }

       private func setupReachability() {
           reachability.whenReachable = { _ in
               self.isInternetConnected = true
           }
           reachability.whenUnreachable = { _ in
               self.isInternetConnected = false
           }

           do {
               try reachability.startNotifier()
           } catch {
               print("Unable to start notifier")
           }
       }
    
    func toggleSave(post: Post) {
            if savedPostIDs.contains(post.id) {
                savedPostIDs.remove(post.id)
            } else {
                savedPostIDs.insert(post.id)
            }
        }
        
        func isPostSaved(post: Post) -> Bool {
            return savedPostIDs.contains(post.id)
        }

    func fetchPosts() {
        let url = URL(string: "https://dummyapi.io/data/v1/post?limit=10")!
        var request = URLRequest(url: url)
        request.addValue("65e052aab5b54c0a267b6017", forHTTPHeaderField: "app-id")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(PostResponse.self, from: data)
                DispatchQueue.main.async {
                    self.posts = decodedResponse.data
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

struct PostResponse: Codable {
    let data: [Post]
}
