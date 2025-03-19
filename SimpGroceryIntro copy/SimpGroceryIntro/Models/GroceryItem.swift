//
//  GroceryItem.swift
//  SimpGroceryIntro
//
//  Created by LI, Hedy on 2025-03-10.
//

import SwiftUI
import SwiftData

@Model
class GroceryItem{
    var name: String
    var obtained : Bool = false

    init(name: String,obtained: Bool = false) {
        self.name = name
        self.obtained = obtained
    }
     
}

