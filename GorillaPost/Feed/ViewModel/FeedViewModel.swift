//
//  FeedViewModel.swift
//  GorillaPost
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import Foundation

class FeedViewModel {
    
    var posts: [Post] = []
    
    func retrievePosts(completion: @escaping (Bool) -> Void) {
        let manager = APIManager()
        manager.retrievePosts { [weak self] posts in
            guard let posts = posts else {
                completion(false)
                return
            }
            
            self?.posts = posts
            completion(true)
        }
    }
}
