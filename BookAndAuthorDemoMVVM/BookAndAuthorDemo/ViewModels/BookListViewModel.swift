//
//  BookViewModel.swift
//  BookAndAuthorDemo
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-04-01.
//
import SwiftUI
import SwiftData

@Observable
class BookViewModel{
  
  func toggleAuthor(_ author: Author ,_ book: Book,_ context : ModelContext) {
      // Code to assign/unassign author from book goes here
    if let index = book.authors.firstIndex(of: author) {
      book.authors.remove(at: index)  // Unassign author
    } else {
      book.authors.append(author)  // Assign author
    }
    try? context.save()
  }
  
  func insertBookCover (_ book : Book, _ context : ModelContext){
    let newCover = BookCover(imageName: "SampleCover", book: book)
    context.insert(newCover)
    try? context.save()
  }
  
  func insertBook(_ title : String, _ context : ModelContext){
    let book = Book(title: title)
    context.insert(book)
    try? context.save()
  }
  func deleteBook( _ bookToDelete : Book?, _ context : ModelContext){
    if let book = bookToDelete {
      context.delete(book)
      try? context.save()
    }
  }
}
