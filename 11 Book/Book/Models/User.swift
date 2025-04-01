//
//  uSER.swift
//  Book
//
//  Created by LI, Hedy on 2025-03-26.
//

 
import SwiftData

@Model
final class User {
    var name: String
    @Relationship(deleteRule: .cascade) var books: [Book] = []
    
    init(name: String) {
        self.name = name
    }
}
