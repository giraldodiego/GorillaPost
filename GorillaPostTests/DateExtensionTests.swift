//
//  DateExtensionTests.swift
//  GorillaPostTests
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import XCTest
@testable import GorillaPost

class DateExtensionTests: XCTestCase {

    var date = Date()
    
    override func setUp() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        if let formattedDate = formatter.date(from: "2020/09/20") {
            date = formattedDate
        }
        
    }

    func testFormatExtension() {
        XCTAssertEqual(date.stringByFormat("yyyy/MM/dd"), "2020/09/20")
    }


}
