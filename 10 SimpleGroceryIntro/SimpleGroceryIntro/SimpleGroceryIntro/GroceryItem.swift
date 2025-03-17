//
//  GroceryItem.swift
//  SimpleGroceryIntro
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-03-10.
//
import SwiftUI
import SwiftData

@Model
class GroceryItem{
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
