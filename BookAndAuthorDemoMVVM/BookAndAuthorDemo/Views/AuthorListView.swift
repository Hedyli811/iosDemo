import SwiftUI
import SwiftData

struct AuthorListView: View {
  @Environment(\.modelContext) private var context
  @State private var newAuthorName = ""
  @State private var authorToDelete: Author?
  @State private var showDeleteDialog = false
  
  @Query private var authors: [Author]
  @Bindable var viewModel = AuthorViewModel()
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(authors) { author in
          NavigationLink(author.name) {
            AuthorDetailView(author: author)
          }
        }.onDelete {IndexSet in
          if let index = IndexSet.first{
            authorToDelete = authors[index]
            showDeleteDialog = true
          }
        }
      }
        .navigationTitle("Authors")
        .toolbar {
          ToolbarItem(placement: .bottomBar) {
            HStack {
              TextField("New Author", text: $newAuthorName)
              Button("Add") {
                  // Code to insert author goes here
                viewModel.insertAuthor(newAuthorName, context)
                newAuthorName = ""
                
              }
            }
          }
        }
        .confirmationDialog("Delete Author?", isPresented: $showDeleteDialog) {
            // Delete confirmation logic goes here
          
          Button("Delete", role : .destructive){
            viewModel.deleteAuthor(authorToDelete, context)
            authorToDelete = nil
          }
          Button("Cencle", role : .cancel){
            authorToDelete = nil
          }
        }
      }
    }
  }

