//
//  StringExtension.swift
//  WTest
//
//  Created by Raphael Alkamim on 25/09/22.
//

import Foundation

extension String {
    func substring(_ location: Int, length: Int) -> String {
        return (self as NSString).substring(with: NSMakeRange(location, length))
    }
    
    func formatterPC() -> String {
        let string = self
        var code = ""
        code = string.substring(0, length: 4) + "-"
        code += string.substring(3, length: 3)
        return code
    }
}
