//
//  APIManager.swift
//  GorillaPost
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import Foundation

typealias PostResponse = (_ posts: [Post]?) -> Void

struct APIManager {
    func retrievePosts(completion: @escaping PostResponse) {
        guard let url = URL(string: "https://gl-endpoint.herokuapp.com/feed") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let json = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: json)
                completion(posts)
            } catch let error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
