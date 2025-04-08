//
//  uSER.swift
//  Book
//
// Hedy Li
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
