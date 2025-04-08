import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @State private var newBookTitle = ""
    @State private var bookToDelete: Book?
    @State private var showDeleteDialog = false

    @Query private var books: [Book]
    @Bindable var viewModel = BookViewModel()

    var body: some View {
        NavigationStack {
            List {
                // List of books and delete action goes here
              ForEach(books) { book in
                NavigationLink(book.title) {
                  BookDetailView(book: book)
                }
              }.onDelete{ IndexSet in
                if let index = IndexSet.first{
                  bookToDelete = books[index]
                  showDeleteDialog = true
                }
                
              }
            }
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("New Book", text: $newBookTitle)
                        Button("Add") {
                            // Code to insert book goes here
                          viewModel.insertBook(newBookTitle, context)
                          newBookTitle = ""
                        }
                    }
                }
            }
            .confirmationDialog("Delete Book?", isPresented: $showDeleteDialog) {
                // Delete confirmation logic goes here
              Button("Delete", role : .destructive){
                viewModel.deleteBook(bookToDelete, context)
                bookToDelete = nil
              }
              Button("Cencle", role : .cancel){
                bookToDelete = nil
              }
            }
        }
    }
}
