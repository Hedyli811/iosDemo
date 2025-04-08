import SwiftUI
import SwiftData

struct BookDetailView: View {
    @Environment(\.modelContext) private var context
    @Bindable var book: Book
    @Query private var authors: [Author]

    var body: some View {
        List {
            Section(header: Text("Tap to assign/unassign authors")) {
                // List of authors and toggle logic goes here
                ForEach(authors){
                    author in
                    HStack{
                        Text(author.name)
                        Spacer()
                        if book.authors.contains(author){
                            Image(systemName: "checkmark")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleAuthor(author)
                    }
                }
            }
            
            Section(header:Text("Cover")){
                if let cover = book.cover{
                    Image(cover.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight:200)
                }else{
                    Text("No cover assigned")
                }
                
                Button("Assign Sample Cover"){
                    let newCover = BookCover(book: book, imageName: "SampleCover")
                    context.insert(newCover)
                    try? context.save()
                }
            }
        }
        .navigationTitle(book.title)
    }

    private func toggleAuthor(_ author: Author) {
        // Code to assign/unassign author from book goes here
        if let index = book.authors.firstIndex(of: author){
            book.authors.remove(at: index)
        }else{
            book.authors.append(author)
        }
        try? context.save()
    }
}
