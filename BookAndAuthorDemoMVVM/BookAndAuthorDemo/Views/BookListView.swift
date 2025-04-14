import SwiftUI
import SwiftData

struct BookListView: View {
   
    @State private var bookToDelete: Book?
    @State private var showDeleteConfirmation = false
 
    @Bindable var viewModel :BookListViewModel

    var body: some View {
        NavigationStack {
            List {
                // List of books and delete action goes here
                ForEach(viewModel.filteredBooks) { book in
                NavigationLink(
                    destination:  BookDetailView(
                        viewModel:BookDetailViewModel(
                            context:viewModel.context,book:book
                        )
                    )
                ) {
                    Text(book.title)
                }
              }.onDelete{ IndexSet in
                if let index = IndexSet.first,
                   viewModel.filteredBooks.indices.contains(index){
                    bookToDelete = viewModel.filteredBooks[index]
                    showDeleteConfirmation = true
                }
                
              }
            }
            .navigationTitle("Books")
            .searchable(text:$viewModel.searchText,prompt: "Search books")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("New Book", text: $viewModel.newBookTitle)
                        Button("Add") {
                            // Code to insert book goes here
                            viewModel.addBook()
                            viewModel.newBookTitle = ""
                        }
                    }
                }
            }
            .confirmationDialog("Delete Book?",
                                isPresented:$showDeleteConfirmation,
                                titleVisibility: .visible
            ) {
                // Delete confirmation logic goes here
              Button("Delete", role : .destructive){
                  if let book = bookToDelete{
                      viewModel.deleteBook(book)
                      bookToDelete = nil
                  }
              }
              Button("Cencle", role : .cancel){
                bookToDelete = nil
              }
            }
        }
        .alert("error",isPresented: $viewModel.errorState.showAlert){
            Button("OK",role:.cancel){}
        } message:{
            Text(viewModel.errorState.message ?? "an unknown error occurred")
        }
    }
}
