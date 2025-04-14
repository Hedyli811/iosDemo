//
//  BookDetailViewModel.swift
//  BookAndAuthorDemo
//
//  Created by LI, Hedy on 2025-04-08.
//

import SwiftUI
import SwiftData

 
@Observable
class BookDetailViewModel{
    var authors: [Author] = []
    let context: ModelContext
    let book: Book
    
    var errorState = ErrorState()
    
    init(context: ModelContext,book:Book) {
        self.context = context
        self.book = book
        self.loadAuthors()
    }
    
    func loadAuthors(){
        let descriptor = FetchDescriptor<Author>(sortBy: [SortDescriptor(\.name)])
        authors = (try? context.fetch(descriptor)) ?? []
    }
    
    func toggleAuthor(_ author: Author){
        if let index = book.authors.firstIndex(of: author){
            book.authors.remove(at: index)
        }else{
            book.authors.append(author)
        }
        
        do{
            try context.save()
        }catch{
            errorState.message = "could not update authors for this book"
            errorState.showAlert = true
        }
    }
    
    func assignSampleCover(){
        let cover = BookCover(imageName: "SampleCover", book: book)
        context.insert(cover)
        
        do{
            try context.save()
        }catch{
            errorState.message = "could not assign a sample cover"
            errorState.showAlert = true
        }
    }
    
}
