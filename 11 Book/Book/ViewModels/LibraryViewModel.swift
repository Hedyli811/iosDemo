//
//  LibraryViewModel.swift
//  Book
//
//  Created by LI, Hedy on 2025-03-26.
//
 
import SwiftData

@Observable
final class LibraryViewModel {
     var currentUser: User?
     var error: AppError?
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchUser()
    }
    
    func fetchUser() {
        let descriptor = FetchDescriptor<User>()
        currentUser = try? modelContext.fetch(descriptor).first
    }
    
    func createUser(name: String) {
        let newUser = User(name: name)
        modelContext.insert(newUser)
        currentUser = newUser
    }
    
    func addBook(title: String, author: String) throws {
        guard let user = currentUser else { throw AppError.noUserFound }
        guard !title.isEmpty, !author.isEmpty else { throw AppError.invalidInput }
        
        let newBook = Book(title: title, author: author)
        user.books.append(newBook)
    }
    
    func deleteBook(_ book: Book) {
        modelContext.delete(book)
    }
    
    func toggleFinished(for book: Book) {
        book.isFinished.toggle()
    }
}
