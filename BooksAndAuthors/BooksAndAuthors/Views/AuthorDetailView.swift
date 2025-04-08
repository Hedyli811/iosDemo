import SwiftUI
import SwiftData

struct AuthorDetailView: View {
    @Environment(\.modelContext) private var context
    @Bindable var author: Author

    var body: some View {
        List {
            // List of books for this author goes here
      
                ForEach(author.books){
                    book in
                    Text(book.title)
                    
                }
      
        }
        .navigationTitle(author.name)
    }
}
