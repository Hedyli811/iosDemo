//
//  Book.swift
//  Book
//
// Sharmin Shams Ferdausi
//

 
import SwiftData
import SwiftUI

@Model
final class Book {
    var title: String
    var author: String
    var dateAdded: Date
    var isFinished: Bool
    
    
    init(title: String, author: String, dateAdded: Date = .now, isFinished: Bool = false) {
        self.title = title
        self.author = author
        self.dateAdded = dateAdded
        self.isFinished = isFinished
    }
}
