//
//  UserListView.swift
//  Book
//
//  Hedy Li
//

import SwiftUI
import SwiftData

struct UserListView: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]
    @State private var newUserName = ""
    @State private var searchText = ""
     
 
    
  
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            Text(user.name)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text("\(user.books.count) ")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .searchable(text: $searchText,prompt:"Search...")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .navigationTitle("UserList")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("Enter User Name", text: $newUserName)
                            .bold()
                            .font(.subheadline)
                        
                        Button("add") {
                            let user = User(name: newUserName)
                            context.insert(user)
                            newUserName = ""
                        }
                        .disabled(newUserName.isEmpty)
                    }
                }
            }
        }
    }
}

#Preview {
    UserListView()
        .modelContainer(for: [User.self, Book.self], inMemory: true)
}
