//
//  AuthorViewModel.swift
//  BookAndAuthorDemo
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-04-02.
//

import SwiftUI
import SwiftData

@Observable
class AuthorViewModel{
  func insertAuthor(_ name : String, _ context : ModelContext){
    let newAuthor = Author(name: name)
    context.insert(newAuthor)
    try? context.save()
  }
  
  
  func deleteAuthor(_ authorToDelete : Author? , _ context : ModelContext ){
    if let author = authorToDelete{
      context.delete(author)
      try? context.save()
    }
  }
}
