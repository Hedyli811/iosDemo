//
//  AuthorDetailViewModel.swift
//  BookAndAuthorDemo
//
//  Created by LI, Hedy on 2025-04-08.
//

import SwiftUI
import SwiftData

var errorMessage: String? = nil
var showErrorAlert = false

@Observable
class AuthorDetailViewModel{
    var books: [Book] = []
    let author: Author
    
    init(author: Author) {
        self.author = author
        self.books = author.books.sorted(by: {$0.title > $1.title})
    }
}
