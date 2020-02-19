//
//  NepaliDate.swift
//  Easify
//
//  Created by Nabin Shrestha on 1/21/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

public struct NepaliDate {
    public let year: String
    public let month: String
    public let day: String
    
    public init(year: String, month: String, day: String) {
        self.year = year
        self.month = month
        self.day = day
    }
}
