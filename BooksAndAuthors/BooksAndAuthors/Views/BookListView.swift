import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @State private var newBookTitle = ""
    @State private var bookToDelete: Book?
    @State private var showDeleteDialog = false

    @Query private var books: [Book]

    var body: some View {
        NavigationStack {
            List {
                // List of books and delete action goes here
                ForEach(books){
                    book in
                    NavigationLink(book.title){
                        BookDetailView(book:book)
                    }
                }
                .onDelete{
                    IndexSet in
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
                            let newBook =
                            Book(title: newBookTitle)
                            context.insert(newBook)
                            try? context.save()
                            newBookTitle = ""
                            
                        }
                    }
                }
            }
            .confirmationDialog("Delete Book?", isPresented: $showDeleteDialog) {
                // Delete confirmation logic goes here
                Button("Delete",role:.destructive){
                    if let book = bookToDelete{
                        context.delete(book)
                        try? context.save()
                    }
                    bookToDelete = nil
                }
                Button("Cancel",role:.cancel){
                    bookToDelete = nil
                }
            }
        }
    }
}
