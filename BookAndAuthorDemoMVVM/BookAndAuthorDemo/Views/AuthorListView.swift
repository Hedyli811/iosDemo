import SwiftUI
import SwiftData

struct AuthorListView: View {
   
    @Bindable var viewModel : AuthorListViewModel
  
  var body: some View {
    NavigationStack {
      List {
          ForEach(viewModel.authors) { author in
          NavigationLink(author.name) {
            AuthorDetailView(author: author)
          }
        }.onDelete {indexSet in
            indexSet.forEach{
                index in
                let author = viewModel.authors[index]
                viewModel.deleteAuthor(author)
          }
        }
      }
        .navigationTitle("Authors")
        .toolbar {
          ToolbarItem(placement: .bottomBar) {
            HStack {
                TextField("New Author", text: $viewModel.newAuthorName)
              Button("Add") {
                  // Code to insert author goes here
                  viewModel.addAuthor()
                 
              }
            }
          }
        }
        .alert("Error", isPresented: $viewModel.errorState.showAlert){
            Button("OK",role:.cancel){}
        } message:{
            Text(viewModel.errorState.message ?? "something went wrong")
        }
      }
    }
  }

