//
//  PostTests.swift
//  GorillaPostTests
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import XCTest
@testable import GorillaPost

class PostTests: XCTestCase {

    func testPostProperties() {
        let post = Post(id: 1, firstName: "F", lastName: "L", body: "B", date: "1525940534")
        XCTAssertEqual(post.fullName, "F L")
        XCTAssertEqual(post.formattedDate, "10/05/2018")
    }

}
