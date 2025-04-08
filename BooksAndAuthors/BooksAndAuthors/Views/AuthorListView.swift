import SwiftUI
import SwiftData

struct AuthorListView: View {
    @Environment(\.modelContext) private var context
    @State private var newAuthorName = ""
    @State private var authorToDelete: Author?
    @State private var showDeleteDialog = false

    @Query private var authors: [Author]

    var body: some View {
        NavigationStack {
            List {
                // List of authors and delete action goes here
                ForEach(authors) {
                    author in
                    NavigationLink(author.name){
                        AuthorDetailView(author: author)
                    }
                }
                .onDelete{
                    IndexSet in
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
                            let newAuthor = Author(name:newAuthorName)
                            context.insert(newAuthor)
                            try? context.save()
                            newAuthorName = ""
                        }
                    }
                }
            }
            .confirmationDialog("Delete Author?", isPresented: $showDeleteDialog) {
                // Delete confirmation logic goes here
                Button("Delete",role:.destructive){
                    if let author = authorToDelete{
                        context.delete(author)
                        try? context.save()
                    }
                    authorToDelete = nil
                }
                Button("Cancel",role:.cancel){
                    authorToDelete = nil
                }
            }
        }
    }
}
