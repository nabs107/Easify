//
//  Int+Extensions.swift
//  Easify
//
//  Created by Nabin Shrestha on 2/10/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

extension Int {
    public func unicoded() -> String {
        let numberStr = "\(self)"
        
        let nepaliStrArr = numberStr.map { (char) -> String in
            
            let charStr = "\(char)"
            if let index = Int(charStr) {
                return DateDataSource.digits[index]
            } else {
                return charStr
            }
        }
        
        return nepaliStrArr.joined()
    }
}
