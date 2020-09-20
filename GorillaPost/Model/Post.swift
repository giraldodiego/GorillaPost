//
//  Post.swift
//  GorillaPost
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import Foundation

class Post: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case body = "post_body"
        case date = "unix_timestamp"
    }
    
    let id: Int
    let firstName: String
    let lastName: String
    let body: String
    let date: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var formattedDate: String {
        guard let dateDouble = Double(date) else { return "" }
        let dateToFormat = Date(timeIntervalSince1970: dateDouble)
        return dateToFormat.stringByFormat("dd/MM/yyyy")
    }
    
    init(id: Int, firstName: String, lastName: String, body: String, date: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.body = body
        self.date = date
    }
}
