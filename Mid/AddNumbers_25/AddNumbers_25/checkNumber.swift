//
//  checkNumber.swift
//  AddNumbers_25
//
//  Created by LI, Hedy on 2025-01-21.
//

import Foundation

let val4 = "321.4"
let val5 = "check"

extension String {
    var isNumeric :Bool {
        return NumberFormatter().number(from:self) != nil
        
    }
}

print(val4.isNumeric)
        print(val5.isNumeric)
        
    

