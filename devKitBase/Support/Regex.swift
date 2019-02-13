//
//  Regex.swift
//  chargeup
//
//  Created by Megat Syafiq on 14/08/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
struct Regex {
    private let internalExpression: NSRegularExpression
    let pattern: String
    
    init(pattern: String) {
        self.pattern = pattern
        
        try! self.internalExpression = NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    }
    
    func testMatch(input: String) -> Bool {
        let matches = self.internalExpression.matches(in: input, options: .reportCompletion, range: NSMakeRange(0, input.count))
        return matches.count > 0
    }
}

struct Regexes {
    static let emailRegex = Regex(pattern: "^((?!.*\\-{2})(?!.*\\.{2})(?!.*\\_{2})[a-zA-Z0-9_\\-\\.]*)[^\\.\\-\\_\\`\\~\\'\\\"\\!@#$%&*()^]@([a-zA-Z0-9]+)([a-zA-Z0-9_\\-\\.]*)\\.([a-zA-Z]{2,})$")
    
    static let nonEmptyRegex = Regex(pattern: "[^()]")
    
    static let numericRegex = Regex(pattern: "^[0-9]*\\.{0,1}[0-9]*$")
    
    static let passwordRegex = Regex(pattern: "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$")
    
    static let creditCardNumberRegex = Regex(pattern: "^[0-9]+([0-9]+)+$" )
    
    static let nameRegex = Regex(pattern: "^[^±!@£$%^&*_+§¡€#¢§¶•ªº«\\/<>?:;|=.,()]{1,20}$")
}
