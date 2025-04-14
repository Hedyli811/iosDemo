//
//  BookViewModel.swift
//  BookAndAuthorDemo
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-04-01.
//
import SwiftUI
import SwiftData

@Observable
class BookListViewModel{
    
    var newBookTitle = ""
    var books: [Book] = []
    
    var searchText: String  = ""
    var errorState = ErrorState()
    let context : ModelContext
    
    init( context: ModelContext) {
        
        self.context = context
    }
    
    func loadBooks(){
        let descriptor = FetchDescriptor<Book>(sortBy: [SortDescriptor(\.title)])
        books = (try? context.fetch(descriptor)) ?? []
    }
    
    var filteredBooks:[Book]{
        if searchText.isEmpty{
            return books
        }else{
            return books.filter{
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func addBook(){
        guard !newBookTitle.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let book = Book(title: newBookTitle)
        
        context.insert(book)
        
        do{
            try context.save()
            newBookTitle = ""
            loadBooks()
        }
        catch{
            errorState.message = "could not add book"
            errorState.showAlert = true
            loadBooks()
        }
    }
    
    func deleteBook( _ book: Book){
        guard book.authors.isEmpty else{
            errorState.message = "cannot delete a book that has authors"
            errorState.showAlert = true
            return
        }
        
        context.delete(book)
        do{
            try context.save()
            newBookTitle = ""
            loadBooks()
        }
        catch{
            errorState.message = "could not delete it may be a system error"
            errorState.showAlert = true
            loadBooks()
        }
    }
   
}
