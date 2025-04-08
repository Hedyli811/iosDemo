import SwiftUI
import SwiftData

struct BookDetailView: View {
    @Environment(\.modelContext) private var context
    @Bindable var book: Book
    @Query private var authors: [Author]
  @Bindable var viewModel = BookViewModel()

    var body: some View {
        List {
            Section(header: Text("Tap to assign/unassign authors")) {
                // List of authors and toggle logic goes here
              ForEach(authors){
                author in
                HStack{
                  Text (author.name)
                  Spacer()
                  if book.authors.contains(author){
                    Image(systemName: "checkmark")
                  }
                  
                }.contentShape(Rectangle())
                  .onTapGesture{
                    viewModel.toggleAuthor(author,book,context)
                  }
              }
            }
          Section(header: Text("Cover")){
            if let cover = book.cover{
              Image(cover.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight : 200)
            }else{
              Text("No cover assigned")
            }
            Button("Assign simple cover"){
              viewModel.insertBookCover(book,context)
            }
            
          }
        }
        .navigationTitle(book.title)
    }

   //
}
