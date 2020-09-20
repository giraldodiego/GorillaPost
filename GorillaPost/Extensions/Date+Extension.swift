//
//  UIDate+Extension.swift
//  GorillaPost
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import Foundation

extension Date {
    func stringByFormat(_ format: String ) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
