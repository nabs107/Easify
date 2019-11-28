//
//  Option.swift
//  Easify
//
//  Created by Nabin Shrestha on 11/28/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

public struct Option {
    public var label: String
    public var value: String
    
    init(label: String, value: String) {
        self.label = label
        self.value = value
    }
}
