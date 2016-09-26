//
//  Utility.swift
//  pomo
//
//  Created by Daniel Cortez on 9/25/16.
//  Copyright © 2016 HCD. All rights reserved.
//

import Foundation


extension String {
    
    static func randomStringWithLength(_ length: Int) -> (String) {
        
        assert(length > 0, "String length must be greather than 0")
        
        let letterNum = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let total = letterNum.characters.count
        
        // Loop and add characters
        var value = ""
        for _ in  0..<length {
            let random = Int(arc4random_uniform(UInt32(total)))
            let character = letterNum[letterNum.index(letterNum.startIndex, offsetBy: random)]
            value.append(character)
        }
        
        return value
    }
}
