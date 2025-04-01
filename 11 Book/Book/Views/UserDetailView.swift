//
//  UserDetailView.swift
//  Book
//
//  Created by LI, Hedy on 2025-03-26.
//

import SwiftUI
import SwiftData

struct UserDetailView: View {
    @Bindable var user: User
    @State private var newBookTitle = ""
    @State private var newBookAuthor = ""
 
    
    var body: some View {
        List {
            
            Section("book list") {
                ForEach(user.books.sorted(by: { $0.title < $1.title })) { book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .bold()
                            
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: book.isFinished ? "checkmark.circle.fill" : "circle")
                        
                            .onTapGesture {
                                book.isFinished.toggle()
                            }
                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        user.books.remove(at: index)
                    }
                }
            }
            
            Section("add ") {
                TextField("book name", text: $newBookTitle)
                TextField("author", text: $newBookAuthor)
                
                Button("add book") {
                    let book = Book(
                        title: newBookTitle,
                        author: newBookAuthor
                    )
                    user.books.append(book)
                    newBookTitle = ""
                    newBookAuthor = ""
                }
            }
        }
        .navigationTitle("user: " + user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserDetailView(user: User(name: "user"))
        .modelContainer(for: [User.self, Book.self], inMemory: true)
}
