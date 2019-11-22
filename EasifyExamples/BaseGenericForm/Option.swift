//
//  Option.swift
//  BankSmart
//
//  Created by Shreejan Shrestha on 11/11/18.
//  Copyright © 2018 f1soft. All rights reserved.
//

import Foundation
import HandyJSON

public struct Option : HandyJSON {
    public init() {
        
    }
    
    public var label: String?
    public var value: String?
    
    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }
}
