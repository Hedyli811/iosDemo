//
//  AuthorViewModel.swift
//  BookAndAuthorDemo
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-04-02.
//

import SwiftUI
import SwiftData

@Observable
class AuthorListViewModel{
    var newAuthorName = ""
    var authors: [Author] = []
    
    var errorState = ErrorState()
    
    private let context: ModelContext
    
    init(context: ModelContext) {
       
        self.context = context
        
    }
    
    func loadAuthors(){
        let descriptor = FetchDescriptor<Author>(sortBy: [SortDescriptor(\.name)])
        authors = (try? context.fetch( descriptor)) ?? []
    }
    
    func addAuthor(){
        guard !newAuthorName.trimmingCharacters(in: .whitespaces).isEmpty else {return }
        
        let author = Author(name:newAuthorName)
        context.insert(author)
        
        do{
            try context.save()
            newAuthorName = ""
            loadAuthors()
        }catch{
            errorState.message = "faild to add author please try again"
            errorState.showAlert = true
        }
    }
    
    
  
  func deleteAuthor(_ authorToDelete : Author  ){
      context.delete(authorToDelete)
      
      do{
          try context.save()
          loadAuthors()
      }catch{
          errorState.message = "could not delete this author"
          errorState.showAlert = true
          loadAuthors()
      }
  }
}
